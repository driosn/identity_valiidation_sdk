import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/compartido/extensiones/dialogos_extension.dart';
import 'package:sudamericana_validador_identidad/core/compartido/imagenes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/data/repositorios/conversor_imagenes_repositorio_impl.dart';
import 'package:sudamericana_validador_identidad/data/repositorios/reconocimiento_facial_repositorio_impl.dart';
import 'package:sudamericana_validador_identidad/presentacion/clippers/clipper_ovalo.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/camara_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/reconocimiento_facial_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/validador_identidad_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/verificador_similitud_cubit.dart';

class CamaraVerificacionFacialPantalla extends StatefulWidget {
  const CamaraVerificacionFacialPantalla({super.key, required this.orientacionFacial});

  final OrientacionFacial orientacionFacial;

  @override
  State<CamaraVerificacionFacialPantalla> createState() => _CamaraVerificacionFacialPantallaState();
}

class _CamaraVerificacionFacialPantallaState extends State<CamaraVerificacionFacialPantalla> {
  final CamaraCubit _camaraCubit = CamaraCubit(direccionCamara: CameraLensDirection.front);
  late final ReconocimientoFacialCubit _reconocimientoFacialCubit;
  late final VerificadorSimilitudCubit _verificadorSimilitudCubit;

  final camaraKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.mostrarDialogoReconocimientoFacialInfo(widget.orientacionFacial);
    });

    _reconocimientoFacialCubit = ReconocimientoFacialCubit(
      reconocimientoFacialRepositorio: ReconocimientoFacialRepositorioImpl(
        detectorFacial: FaceDetector(options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate)),
      ),
      conversorImagenesRepositorio: ConversorImagenesRepositorioImpl(),
      orientacionFacialEsperada: widget.orientacionFacial,
    );

    _verificadorSimilitudCubit = VerificadorSimilitudCubit();

    _camaraCubit.inicializarCamara(
      alProcesarImagen: (image) {
        _camaraCubit.state.whenOrNull(
          camaraInicializada: (controladorCamara, camaraTrasera) {
            _reconocimientoFacialCubit.procesarImagenDeCamara(
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<ReconocimientoFacialCubit, ReconocimientoFacialState>(
            bloc: _reconocimientoFacialCubit,
            listenWhen: (previous, current) => previous.estadoProcesamiento != current.estadoProcesamiento,

            listener: (context, state) {
              ///
              /// Verificador Similitud
              ///
              ///
              widget.orientacionFacial.whenOrNull(
                centro: () {
                  state.estadoProcesamiento.whenOrNull(
                    completado: (fotoVerificacionFacial) {
                      final fotoPerfilDocumento =
                          context.read<ValidadorIdentidadCubit>().state.datosValidacion.fotoPerfilDocumentoTempSrc;
                      context.read<ValidadorIdentidadCubit>().actualizarFotoSelfie(fotoVerificacionFacial);

                      _verificadorSimilitudCubit.verificarSiEsLaMismaPersona(
                        imagenA: File(fotoPerfilDocumento),
                        imagenB: fotoVerificacionFacial,
                      );
                    },
                  );
                },
              );

              ///
              /// Navegacion sin realizar Verificacion de Similitud
              ///
              state.estadoProcesamiento.whenOrNull(
                completado: (fotoVerificacionFacial) {
                  bool irALaSiguientePantalla = false;
                  widget.orientacionFacial.maybeWhen(
                    izquierda: () => irALaSiguientePantalla = true,
                    derecha: () => irALaSiguientePantalla = true,
                    orElse: () => false,
                  );
                  if (irALaSiguientePantalla) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => widget.orientacionFacial.when(
                              izquierda: () {
                                context.read<ValidadorIdentidadCubit>().emitirEstadoValidacion(
                                  EstadoValidacion.validado(validacionExitosa: true),
                                );
                                return Scaffold(
                                  body: Center(child: Text('Verificacion Facial realizada correctamente')),
                                );
                              },
                              derecha:
                                  () => CamaraVerificacionFacialPantalla(
                                    orientacionFacial: OrientacionFacial.izquierda(),
                                  ),
                              centro:
                                  () =>
                                      CamaraVerificacionFacialPantalla(orientacionFacial: OrientacionFacial.derecha()),
                            ),
                      ),
                    );
                  }
                },
              );
            },
          ),
          BlocListener<VerificadorSimilitudCubit, VerificadorSimilitudState>(
            bloc: _verificadorSimilitudCubit,
            listener: (context, state) {
              state.whenOrNull(
                resultado: (esLaMismaPersona, similaridad, imagenA, imagenB) {
                  context.read<ValidadorIdentidadCubit>().actualizarSimilaridad(similaridad);

                  if (esLaMismaPersona) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const CamaraVerificacionFacialPantalla(orientacionFacial: OrientacionFacial.derecha()),
                      ),
                    );
                  } else {
                    // context.mostrarDialogoReconocimientoFacialInfoError();
                    context.read<ValidadorIdentidadCubit>().emitirEstadoValidacion(
                      EstadoValidacion.validado(validacionExitosa: false),
                    );
                  }
                },
              );
            },
          ),
        ],
        child: BlocBuilder<CamaraCubit, CamaraState>(
          bloc: _camaraCubit,
          builder: (context, state) {
            return state.when(
              inicial: () => const Center(child: CircularProgressIndicator()),
              camaraInicializando: () => const Center(child: CircularProgressIndicator()),
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
                    ],
                  ),
              camaraSinPermisos: () => const Center(child: Text('No tienes permisos para usar la camara')),
              camaraError: (mensaje) => Center(child: Text(mensaje)),
            );
          },
        ),
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
          SizedBox(height: Tamano.t32),
          Text(
            orientacionFacial.when(
              izquierda: () => 'Mira a la izquierda',
              derecha: () => 'Mira a la derecha',
              centro: () => 'Mira de frente',
            ),
            style: TextStyle(color: Colores.textoPrincipal, fontSize: Tamano.t20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Mantén tu rostro dentro del marco',
            style: TextStyle(color: Colores.textoPrincipal, fontSize: Tamano.t16),
          ),
          SizedBox(height: Tamano.t24),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Cámara con óvalo
                Transform.scale(
                  scale: 1.2,
                  child: ClipPath(
                    clipper: ClipperOvalo(),
                    child: RepaintBoundary(key: camaraKey, child: CameraPreview(controladorCamara)),
                  ),
                ),
                // Máscara facial sobre el óvalo
                Transform.scale(
                  scale: 1.2,
                  child: SizedBox(
                    height: 230,
                    child: Opacity(
                      opacity: 0.65,
                      child: Image.asset(
                        orientacionFacial.when(
                          izquierda: () => Imagenes.mascaraFacialIzquierda,
                          derecha: () => Imagenes.mascaraFacialDerecha,
                          centro: () => Imagenes.mascaraFacialFrontal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'La foto se tomará automáticamente',
            style: TextStyle(color: Colores.textoPrincipal, fontSize: Tamano.t16),
          ),
          SizedBox(height: Tamano.t32),
        ],
      ),
    );
  }
}
