import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_documento.dart';
import 'package:sudamericana_validador_identidad/data/repositorios/ocr_repositorio_impl.dart';
import 'package:sudamericana_validador_identidad/data/servicios/ocr_servicio.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/camara_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/documento_ocr_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/validador_identidad_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/pantallas/informacion_pantalla.dart';

class CamaraCarnetPantalla extends StatefulWidget {
  const CamaraCarnetPantalla({super.key, required this.orientacionDocumento});

  final OrientacionDocumento orientacionDocumento;

  @override
  State<CamaraCarnetPantalla> createState() => _CamaraCarnetPantallaState();
}

class _CamaraCarnetPantallaState extends State<CamaraCarnetPantalla> {
  final _camaraCubit = CamaraCubit(direccionCamara: CameraLensDirection.back);
  late final DocumentoOCRCubit _documentoOCRCubit;

  @override
  void initState() {
    super.initState();

    _documentoOCRCubit = DocumentoOCRCubit(
      ocrRepositorio: OcrRepositorioImpl(ocrServicio: OcrServicio()),
      orientacionEsperada: widget.orientacionDocumento,
    );

    _camaraCubit.inicializarCamara(
      alProcesarImagen: (image) {
        _camaraCubit.state.whenOrNull(
          camaraInicializada: (controladorCamara, camaraTrasera) {
            _documentoOCRCubit.procesarImagenDeCamara(
              imagen: image,
              controladorCamara: controladorCamara,
              camara: camaraTrasera,
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _camaraCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DocumentoOCRCubit, DocumentoOCRState>(
        bloc: _documentoOCRCubit,
        listener: (context, state) {
          // print('Input Image: ${state.inputImage}');

          // if (state.inputImage != null) {
          //   _documentoOCRCubit.procesarImagen(
          //     imagenDeEntrada: state.inputImage!,
          //     camara:
          //         _camaraCubit.state.whenOrNull(
          //           camaraInicializada:
          //               (controladorCamara, camaraTrasera) => camaraTrasera,
          //         )!,
          //   );
          // }
        },
        child: BlocBuilder<CamaraCubit, CamaraState>(
          bloc: _camaraCubit,
          builder: (context, state) {
            return state.when(
              inicial: () => const _VistaCamaraInicial(),
              camaraInicializando: () => const _VistaCamaraInicializando(),
              camaraInicializada:
                  (controladorCamara, camaraTrasera) =>
                      _VistaCamaraInicializada(
                        controladorCamara: controladorCamara,
                        documentoOCRCubit: _documentoOCRCubit,
                        orientacionDocumento: widget.orientacionDocumento,
                      ),
              camaraSinPermisos: () => const _VistaCamaraSinPermisos(),
              camaraError: (mensaje) => Center(child: Text(mensaje)),
            );
          },
        ),
      ),
    );
  }
}

class _VistaCamaraInicial extends StatelessWidget {
  const _VistaCamaraInicial();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _VistaCamaraInicializando extends StatelessWidget {
  const _VistaCamaraInicializando();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: Tamano.t16),
          Text('Inicializando cámara'),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _VistaCamaraInicializada extends StatelessWidget {
  _VistaCamaraInicializada({
    required this.controladorCamara,
    required this.documentoOCRCubit,
    required this.orientacionDocumento,
  });

  final DocumentoOCRCubit documentoOCRCubit;
  final OrientacionDocumento orientacionDocumento;
  final CameraController controladorCamara;

  final _camaraKey = GlobalKey();
  final _guiaCamaraKey = GlobalKey();

  final bool _showEdges = false;
  Offset? topLeftEdge;
  Offset? topRightEdge;
  Offset? bottomLeftEdge;
  Offset? bottomRightEdge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,

      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: RepaintBoundary(
                key: _camaraKey,
                child: CameraPreview(controladorCamara),
              ),
            ),

            ///
            /// Mascara instrucciones
            ///
            OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                final rotationDegrees =
                    orientation == Orientation.landscape ? -90.0 : 0.0;

                return Transform.rotate(
                  angle: rotationDegrees * math.pi / 180,
                  child: Column(
                    children: [
                      SizedBox(height: Tamano.t64),
                      SizedBox(
                        width: double.infinity,
                        child: const Text(
                          'Muestra el anverso del carnet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Tamano.t20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SFProText',
                          ),
                        ),
                      ),

                      ///
                      /// Mascara guía de la cámara
                      ///
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Tamano.t32,
                            vertical: Tamano.t16,
                          ),
                          child: AspectRatio(
                            aspectRatio:
                                0.63, // proporción estándar del documento
                            child: RepaintBoundary(
                              key: _guiaCamaraKey,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  color: Colors.transparent,
                                ),
                                width: MediaQuery.of(context).size.width * 0.9,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: Tamano.t16),

                      ///
                      /// Mascara texto de la foto
                      ///
                      SizedBox(
                        width: double.infinity,
                        child: const Text(
                          'La foto se tomará automáticamente',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Tamano.t20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SFProText',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            Positioned.fill(
              child: BlocConsumer<DocumentoOCRCubit, DocumentoOCRState>(
                bloc: documentoOCRCubit,
                listenWhen:
                    (previous, current) =>
                        previous.estadoProcesamiento !=
                        current.estadoProcesamiento,
                listener: (context, state) {
                  state.estadoProcesamiento.whenOrNull(
                    completado: (resultadoOcr) {
                      resultadoOcr.when(
                        carnetComputarizadoAnverso: (
                          numero,
                          emision,
                          expiracion,
                          tipoDocumento,
                        ) async {
                          if (orientacionDocumento
                              is OrientacionDocumentoAnverso) {
                            final foto = await _captureRect();
                            context
                                .read<ValidadorIdentidadCubit>()
                                .actualizarDatosValidacionSegunOcr(
                                  resultadoOcr,
                                );
                            context
                                .read<ValidadorIdentidadCubit>()
                                .actualizarFoto(foto);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => InformacionPantalla(
                                      tipoInformacion: DocumentoReverso(),
                                    ),
                              ),
                            );
                          }
                        },
                        carnetComputarizadoReverso: (nombre, tipoDocumento) {
                          if (orientacionDocumento
                              is OrientacionDocumentoReverso) {
                            context
                                .read<ValidadorIdentidadCubit>()
                                .actualizarDatosValidacionSegunOcr(
                                  resultadoOcr,
                                );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => InformacionPantalla(
                                      tipoInformacion: FotoFrontal(),
                                    ),
                              ),
                            );
                            return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => Scaffold(
                                      body: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Nombre: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.nombre}',
                                            ),
                                            Text(
                                              'Número: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.numero}',
                                            ),
                                            Text(
                                              'Emisión: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.emision}',
                                            ),
                                            Text(
                                              'Expiración: ${context.read<ValidadorIdentidadCubit>().state.datosValidacion.expiracion}',
                                            ),
                                            Image.file(
                                              File(
                                                context
                                                    .read<
                                                      ValidadorIdentidadCubit
                                                    >()
                                                    .state
                                                    .datosValidacion
                                                    .fotoTempSrc,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return state.customPaint ?? const SizedBox.shrink();
                },
              ),
            ),

            if (_showEdges) ...[
              Transform.translate(
                offset: Offset(topLeftEdge!.dx - 5, topLeftEdge!.dy - 5),
                child: Container(width: 10, height: 10, color: Colors.purple),
              ),
              Transform.translate(
                offset: Offset(topRightEdge!.dx - 5, topRightEdge!.dy - 5),
                child: Container(width: 10, height: 10, color: Colors.purple),
              ),
              Transform.translate(
                offset: Offset(bottomLeftEdge!.dx - 5, bottomLeftEdge!.dy - 5),
                child: Container(width: 10, height: 10, color: Colors.purple),
              ),
              Transform.translate(
                offset: Offset(
                  bottomRightEdge!.dx - 5,
                  bottomRightEdge!.dy - 5,
                ),
                child: Container(width: 10, height: 10, color: Colors.purple),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<File> _obtenerFoto() async {
    try {
      await Future.delayed(Duration(milliseconds: 100));

      final RenderRepaintBoundary? boundary =
          _guiaCamaraKey.currentContext?.findRenderObject()
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

  Future<File> _captureRect() async {
    try {
      await Future.delayed(Duration(milliseconds: 100));

      final RenderRepaintBoundary? boundary =
          _camaraKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;

      final renderBox =
          _guiaCamaraKey.currentContext!.findRenderObject() as RenderBox;

      // Posición en coordenadas absolutas en pantalla
      final position = renderBox.localToGlobal(Offset.zero);

      // Tamaño del rectángulo
      final size = renderBox.size;

      print('X: ${position.dx}, Y: ${position.dy}');
      print('Ancho: ${size.width}, Alto: ${size.height}');

      if (boundary == null) {
        throw Exception('No se pudo obtener el RenderRepaintBoundary');
      }

      final ui.Image image = await boundary.toImage();
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw Exception('No se pudo obtener el bytes de la imagen');
      }

      final pngBytes = byteData.buffer.asUint8List();

      final img.Image cropImg = img.decodeImage(pngBytes)!;
      img.Image cropped = img.copyCrop(
        cropImg,
        x: position.dx.toInt() - 170,
        y: position.dy.toInt() - 130,
        width: size.width.toInt(),
        height: size.height.toInt() ~/ 2,
      );

      Uint8List croppedBytes = Uint8List.fromList(img.encodePng(cropped));

      final directory = await getTemporaryDirectory();
      final filePath =
          '${directory.path}/payment_detail_${DateTime.now().millisecondsSinceEpoch}.png';

      final file = File(filePath);
      await file.writeAsBytes(croppedBytes);

      return file;
    } catch (e) {
      rethrow;
    }
  }
}

class _VistaCamaraSinPermisos extends StatelessWidget {
  const _VistaCamaraSinPermisos();

  @override
  Widget build(BuildContext context) {
    return const Text('No tienes permisos para usar la cámara');
  }
}
