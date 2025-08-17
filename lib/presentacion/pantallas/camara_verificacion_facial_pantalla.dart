import 'dart:io';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sudamericana_validador_identidad/core/compartido/imagenes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/camara_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/validador_identidad_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/pantallas/informacion_pantalla.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: 4000));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => widget.orientacionFacial.when(
                izquierda:
                    () => CamaraVerificacionFacialPantalla(
                      orientacionFacial: OrientacionFacial.derecha(),
                    ),
                derecha: () {
                  print('===============================================');
                  print('Datos verificados:');
                  print(
                    'Nombre: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.nombre}',
                  );
                  print(
                    'Numero: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.numero}',
                  );
                  print(
                    'Emision: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.emision}',
                  );
                  print(
                    'Expiracion: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.expiracion}',
                  );
                  print(
                    'UbicaciónFoto: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.fotoTempSrc}',
                  );
                  print('===============================================');

                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Verificacion realizada correctamente'),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => InformacionPantalla(
                                        tipoInformacion: DocumentoAnverso(),
                                      ),
                                ),
                              );
                            },
                            child: Text('Reiniciar'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                centro:
                    () => CamaraVerificacionFacialPantalla(
                      orientacionFacial: OrientacionFacial.izquierda(),
                    ),
              ),
        ),
      );
    });
    _camaraCubit.inicializarCamara(
      alProcesarImagen: (imagen) {
        // if (procesando) return;
        // procesando = true;
        //
        // Future.delayed(Duration(milliseconds: 500), () {
        // procesando = false;
        // });

        // get image rotation
        // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
        // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
        // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart

        // _camaraCubit.state.whenOrNull(
        //   camaraInicializada: (controladorCamara, camara) {
        //     final orientacionDeSensor = camara.sensorOrientation;
        //     InputImageRotation? rotacion;
        //     if (Platform.isIOS) {
        //       rotacion = InputImageRotationValue.fromRawValue(
        //         orientacionDeSensor,
        //       );
        //     } else if (Platform.isAndroid) {
        //       var compensacionDeRotacion =
        //           controladorCamara.obtenerCompensacionDeRotacion();
        //       if (compensacionDeRotacion == null) return;
        //       if (camara.lensDirection == CameraLensDirection.front) {
        //         // front-facing
        //         compensacionDeRotacion =
        //             (orientacionDeSensor + compensacionDeRotacion) % 360;
        //       } else {
        //         // back-facing
        //         compensacionDeRotacion =
        //             (orientacionDeSensor - compensacionDeRotacion + 360) % 360;
        //       }
        //       rotacion = InputImageRotationValue.fromRawValue(
        //         compensacionDeRotacion,
        //       );
        //       // print('rotationCompensation: $rotationCompensation');
        //     }
        //     if (rotacion == null) return;
        //     // print('final rotation: $rotation');

        //     final plano = imagen.planes.firstOrNull;
        //     if (plano == null) {
        //       return;
        //     }

        //     // get image format
        //     final format = InputImageFormatValue.fromRawValue(
        //       imagen.format.raw,
        //     );
        //     // validate format depending on platform
        //     // only supported formats:
        //     // * nv21 for Android
        //     // * bgra8888 for iOS
        //     if (format == null ||
        //         (Platform.isIOS && format != InputImageFormat.bgra8888)) {
        //       return;
        //     }

        //     // since format is constraint to nv21 or bgra8888, both only have one plane
        //     // if (imagen.planes.length != 1) return;
        //     // final plano = imagen.planes.first;

        //     final Uint8List bytes;
        //     if (Platform.isAndroid) {
        //       bytes = imagen.getNv21Uint8List();
        //     } else {
        //       final allBytes = WriteBuffer();
        //       for (final plane in imagen.planes) {
        //         allBytes.putUint8List(plane.bytes);
        //       }
        //       bytes = allBytes.done().buffer.asUint8List();
        //     }

        //     // compose InputImage using bytes
        //     final imagenDeEntrada = InputImage.fromBytes(
        //       bytes: bytes,
        //       metadata: InputImageMetadata(
        //         size: Size(imagen.width.toDouble(), imagen.height.toDouble()),
        //         rotation: rotacion, // used only in Android
        //         format:
        //             Platform.isAndroid
        //                 ? InputImageFormat.nv21
        //                 : format, // used only in iOS
        //         bytesPerRow: plano.bytesPerRow, // used only in iOS
        //       ),
        //     );

        //     // emit(state.copyWith(inputImage: imagenDeEntrada));

        //     // Procesar la imagen inmediatamente después de emitir
        //     procesarImagen(imagenDeEntrada);
        //   },
        // );
      },
    );
  }

  void procesarImagen(InputImage image) async {
    final faces = await faceDetector.processImage(image);
    if (faces.isNotEmpty) {
      final face = faces.first;

      final rotacion = face.headEulerAngleY;
      final rotacionX = face.headEulerAngleX;

      print('rotacion: $rotacion');

      widget.orientacionFacial.when(
        izquierda: () {
          if (rotacion != null && rotacion > 20) {
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
          if (rotacion != null && rotacion > -20) {
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
          _rotacion.value = rotacionX ?? 0;
          return;

          if (rotacion != null && rotacion < 3 && rotacion > -3) {
            // final file = await _obtenerFoto();

            _camaraCubit.dispose();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => CamaraVerificacionFacialPantalla(
                      orientacionFacial: OrientacionFacial.derecha(),
                    ),
              ),
            );
          }
        },
      );

      _rotacion.value = rotacionX ?? 0;
    }
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
          Stack(
            children: [
              // Cámara con óvalo
              Transform.scale(
                scale: 0.65,
                child: ClipOval(
                  child: AspectRatio(
                    aspectRatio: 3 / 4, // Más alto y menos ancho
                    child: RepaintBoundary(
                      child: CameraPreview(controladorCamara),
                    ),
                  ),
                ),
              ),
              // Líneas de guía
              Transform.scale(
                scale: 0.65,
                child: ClipOval(
                  child: AspectRatio(
                    aspectRatio: 3 / 4, // Más alto y menos ancho
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.65,
                              child: Image.asset(Imagenes.mascaraFacialFrontal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Tamano.t24),
          Text('La foto se tomará automáticamente'),
        ],
      ),
    );
  }
}
