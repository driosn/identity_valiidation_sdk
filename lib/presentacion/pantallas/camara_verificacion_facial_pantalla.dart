import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:sudamericana_validador_identidad/core/compartido/extensiones/orientacion_dispositivo_extension.dart';
import 'package:sudamericana_validador_identidad/core/compartido/imagenes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/presentacion/clippers/clipper_ovalo.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/camara_cubit.dart';

class CamaraVerificacionFacialPantalla extends StatefulWidget {
  const CamaraVerificacionFacialPantalla({
    super.key,
    required this.orientacionFacial,
  });

  final OrientacionFacial orientacionFacial;

  @override
  State<CamaraVerificacionFacialPantalla> createState() =>
      _CamaraVerificacionFacialPantallaState();
}

class _CamaraVerificacionFacialPantallaState
    extends State<CamaraVerificacionFacialPantalla> {
  final CamaraCubit _camaraCubit = CamaraCubit(
    direccionCamara: CameraLensDirection.front,
  );

  final ValueNotifier<double> _rotacion = ValueNotifier(0);

  final faceDetector = FaceDetector(
    options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate),
  );

  final camaraKey = GlobalKey();
  bool procesando = false;

  @override
  void initState() {
    super.initState();

    _camaraCubit.inicializarCamara(
      alProcesarImagen: (imagen) {
        if (procesando) return;
        procesando = true;

        Future.delayed(Duration(milliseconds: 500), () {
          procesando = false;
        });

        _camaraCubit.state.whenOrNull(
          camaraInicializada: (controladorCamara, camara) {
            final orientacionDeSensor = camara.sensorOrientation;
            InputImageRotation? rotacion;
            if (Platform.isIOS) {
              rotacion = InputImageRotationValue.fromRawValue(
                orientacionDeSensor,
              );
            } else if (Platform.isAndroid) {
              var compensacionDeRotacion =
                  controladorCamara.obtenerCompensacionDeRotacion();
              if (compensacionDeRotacion == null) return;
              if (camara.lensDirection == CameraLensDirection.front) {
                // front-facing
                compensacionDeRotacion =
                    (orientacionDeSensor + compensacionDeRotacion) % 360;
              } else {
                // back-facing
                compensacionDeRotacion =
                    (orientacionDeSensor - compensacionDeRotacion + 360) % 360;
              }
              rotacion = InputImageRotationValue.fromRawValue(
                compensacionDeRotacion,
              );
              // print('rotationCompensation: $rotationCompensation');
            }
            if (rotacion == null) return;
            // print('final rotation: $rotation');

            // get image format
            final format = InputImageFormatValue.fromRawValue(
              imagen.format.raw,
            );
            // validate format depending on platform
            // only supported formats:
            // * nv21 for Android
            // * bgra8888 for iOS
            if (format == null ||
                (Platform.isAndroid && format != InputImageFormat.nv21) ||
                (Platform.isIOS && format != InputImageFormat.bgra8888)) {
              return null;
            }

            // since format is constraint to nv21 or bgra8888, both only have one plane
            if (imagen.planes.length != 1) return;
            final plano = imagen.planes.first;

            // compose InputImage using bytes
            final imagenDeEntrada = InputImage.fromBytes(
              bytes: plano.bytes,
              metadata: InputImageMetadata(
                size: Size(imagen.width.toDouble(), imagen.height.toDouble()),
                rotation: rotacion, // used only in Android
                format: format, // used only in iOS
                bytesPerRow: plano.bytesPerRow, // used only in iOS
              ),
            );

            // emit(state.copyWith(inputImage: imagenDeEntrada));

            // Procesar la imagen inmediatamente después de emitir
            procesarImagen(
              imagenDeEntrada: imagenDeEntrada,
              imagenDeCamara: imagen,
            );
          },
        );
      },
    );
  }

  void procesarImagen({
    required CameraImage imagenDeCamara,
    required InputImage imagenDeEntrada,
  }) async {
    final faces = await faceDetector.processImage(imagenDeEntrada);

    print('FACES: ${faces.length}');
    if (faces.isNotEmpty) {
      final face = faces.first;

      final rotacionHorizontal = face.headEulerAngleY;

      print('rotacion: $rotacionHorizontal');

      widget.orientacionFacial.when(
        izquierda: () {
          if (rotacionHorizontal != null && rotacionHorizontal > 35) {
            _camaraCubit.dispose();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Scaffold(
                      body: Center(
                        child: Text('Verificacion realizada correctamente'),
                      ),
                    ),
              ),
            );
          }
        },
        derecha: () {
          if (rotacionHorizontal != null && rotacionHorizontal < -35) {
            _camaraCubit.dispose();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => CamaraVerificacionFacialPantalla(
                      orientacionFacial: OrientacionFacial.izquierda(),
                    ),
              ),
            );
          }
        },
        centro: () async {
          if (rotacionHorizontal != null &&
              rotacionHorizontal < 2 &&
              rotacionHorizontal > -2) {
            final file = await _cameraImageToFile(imagenDeCamara);

            showDialog(
              context: context,
              builder: (context) {
                return Dialog(child: Image.file(file));
              },
            );

            _camaraCubit.dispose();

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder:
            //         (context) => CamaraVerificacionFacialPantalla(
            //           orientacionFacial: OrientacionFacial.derecha(),
            //         ),
            //   ),
            // );
          }
        },
      );
    }
  }

  Future<File> _cameraImageToFile(CameraImage cameraImage) async {
    try {
      // Obtener el directorio temporal
      final directory = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '${directory.path}/camera_image_$timestamp.raw';

      // Obtener los bytes del primer plano (Y channel)
      final plane = cameraImage.planes.first;
      final bytes = plane.bytes;

      // Escribir bytes al archivo
      final file = nv21ToFile(bytes, cameraImage.width, cameraImage.height);

      return file;
    } catch (e) {
      throw Exception('Error al convertir CameraImage a File: $e');
    }
  }

  Future<File> nv21ToFile(Uint8List nv21, int width, int height) async {
    // Convert NV21 → RGB
    img.Image rgbImage = _convertNV21ToImage(nv21, width, height);

    // Encode to PNG
    rgbImage = img.copyRotate(rgbImage, angle: -90);
    final pngBytes = img.encodePng(rgbImage);

    // Save to file
    final directory = await getTemporaryDirectory();
    final filePath =
        '${directory.path}/camera_image_${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File(filePath);
    await file.writeAsBytes(pngBytes);
    return file;
  }

  img.Image _convertNV21ToImage(Uint8List bytes, int width, int height) {
    final int frameSize = width * height;
    final img.Image image = img.Image(width: width, height: height);

    for (int j = 0, yp = 0; j < height; j++) {
      int uvp = frameSize + (j >> 1) * width;
      int u = 0, v = 0;

      for (int i = 0; i < width; i++, yp++) {
        int y = (0xff & bytes[yp]) - 16;
        if (y < 0) y = 0;

        if ((i & 1) == 0) {
          v = (0xff & bytes[uvp++]) - 128;
          u = (0xff & bytes[uvp++]) - 128;
        }

        int y1192 = 1192 * y;
        int r = (y1192 + 1634 * v);
        int g = (y1192 - 833 * v - 400 * u);
        int b = (y1192 + 2066 * u);

        r = (r < 0 ? 0 : (r > 262143 ? 262143 : r)) >> 10;
        g = (g < 0 ? 0 : (g > 262143 ? 262143 : g)) >> 10;
        b = (b < 0 ? 0 : (b > 262143 ? 262143 : b)) >> 10;

        image.setPixelRgba(i, j, r, g, b, 255);
      }
    }
    return image;
  }

  Future<File> _obtenerFoto() async {
    try {
      await Future.delayed(Duration(milliseconds: 100));

      final RenderRepaintBoundary? boundary =
          camaraKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;

      if (boundary == null) {
        throw Exception('No se pudo obtener el RenderRepaintBoundary');
      }

      final ui.Image image = await boundary.toImage();
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw Exception('No se pudo obtener el bytes de la imagen');
      }

      final pngBytes = byteData.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final filePath =
          '${directory.path}/payment_detail_${DateTime.now().millisecondsSinceEpoch}.png';

      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CamaraCubit, CamaraState>(
        bloc: _camaraCubit,
        builder: (context, state) {
          return state.when(
            inicial: () => const Center(child: CircularProgressIndicator()),
            camaraInicializando:
                () => const Center(child: CircularProgressIndicator()),
            camaraInicializada:
                (controladorCamara, camara) => Column(
                  children: [
                    Expanded(
                      child: _CamaraInicializada(
                        controladorCamara: controladorCamara,
                        camaraKey: camaraKey,
                        orientacionFacial: widget.orientacionFacial,
                      ),
                    ),
                    // ValueListenableBuilder(
                    //   valueListenable: _rotacion,
                    //   builder: (context, value, child) {
                    //     return Text('rotacion: $value');
                    //   },
                    // ),
                  ],
                ),
            camaraSinPermisos:
                () => const Center(
                  child: Text('No tienes permisos para usar la camara'),
                ),
            camaraError: (mensaje) => Center(child: Text(mensaje)),
          );
        },
      ),
    );
  }
}

class _CamaraInicializada extends StatelessWidget {
  const _CamaraInicializada({
    required this.orientacionFacial,
    required this.controladorCamara,
    required this.camaraKey,
  });

  final OrientacionFacial orientacionFacial;
  final CameraController controladorCamara;
  final GlobalKey camaraKey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          // ElevatedButton(
          // onPressed: () async {
          // final file = await _obtenerFoto();
          // showDialog(
          // context: context,
          // builder: (context) => Dialog(child: Image.file(file)),
          // );
          // },
          // child: Text('Tomar foto'),
          // ),
          Text(
            orientacionFacial.when(
              izquierda: () => 'Mira a la izquierda',
              derecha: () => 'Mira a la derecha',
              centro: () => 'Mira de frente',
            ),
          ),
          Text('Mantén tu rostro dentro del marco'),
          SizedBox(height: Tamano.t24),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Cámara con óvalo
                Container(
                  color: Colors.purple,
                  child: ClipPath(
                    clipper: ClipperOvalo(),
                    child: RepaintBoundary(
                      key: camaraKey,
                      child: CameraPreview(controladorCamara),
                    ),
                  ),
                ),
                // Máscara facial sobre el óvalo
                SizedBox(
                  height: 230,
                  child: Opacity(
                    opacity: 0.65,
                    child: Image.asset(
                      Imagenes.mascaraFacialFrontal,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Tamano.t24),
          Text('La foto se tomará automáticamente'),
        ],
      ),
    );
  }
}
