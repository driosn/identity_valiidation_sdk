import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:sudamericana_validador_identidad/core/compartido/extensiones/orientacion_dispositivo_extension.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/dominio/repositorios/conversor_imagenes_repositorio.dart';
import 'package:sudamericana_validador_identidad/dominio/repositorios/reconocimiento_facial_repositorio.dart';

part 'reconocimiento_facial_cubit.freezed.dart';

class ReconocimientoFacialCubit extends Cubit<ReconocimientoFacialState> {
  ReconocimientoFacialCubit({
    required ReconocimientoFacialRepositorio reconocimientoFacialRepositorio,
    required ConversorImagenesRepositorio conversorImagenesRepositorio,
    required OrientacionFacial orientacionFacialEsperada,
  }) : _reconocimientoFacialRepositorio = reconocimientoFacialRepositorio,
       _conversorImagenesRepositorio = conversorImagenesRepositorio,
       super(
         ReconocimientoFacialState(
           estadoProcesamiento: EstadoProcesamiento.noProcesando(),
           orientacionFacialEsperada: orientacionFacialEsperada,
           contadorVerificacionesCorrectas: 0,
         ),
       );

  final ReconocimientoFacialRepositorio _reconocimientoFacialRepositorio;
  final ConversorImagenesRepositorio _conversorImagenesRepositorio;

  final int _numeroDeVerificacionesCorrectasRequeridas = 5;

  void procesarImagen({
    required CameraImage imagenDeCamara,
    required InputImage imagenDeEntrada,
    required CameraDescription camara,
  }) async {
    try {
      if (state.estadoProcesamiento is _Completado) {
        return;
      }

      emit(state.copyWith(estadoProcesamiento: EstadoProcesamiento.procesando()));

      final resultadoOrientacionFacial = await _reconocimientoFacialRepositorio.reconocerOrientacionFacial(
        imagenDeEntrada,
      );

      resultadoOrientacionFacial.when(
        caraEncontrada:
            (orientacion) =>
                orientacion == state.orientacionFacialEsperada
                    ? emit(state.copyWith(contadorVerificacionesCorrectas: state.contadorVerificacionesCorrectas + 1))
                    : emit(state.copyWith(contadorVerificacionesCorrectas: 0)),
        caraNoEncontrada: () => emit(state.copyWith(contadorVerificacionesCorrectas: 0)),
      );

      if (state.contadorVerificacionesCorrectas >= _numeroDeVerificacionesCorrectasRequeridas) {
        final fotoVerificacionFacial = await _conversorImagenesRepositorio.convertirCameraImageNv21AFile(
          imagenDeCamara,
        );

        emit(
          state.copyWith(
            estadoProcesamiento: EstadoProcesamiento.completado(fotoVerificacionFacial: fotoVerificacionFacial),
          ),
        );

        return;
      }

      emit(state.copyWith(estadoProcesamiento: EstadoProcesamiento.noProcesando()));
    } catch (e) {
      emit(state.copyWith(contadorVerificacionesCorrectas: 0, estadoProcesamiento: EstadoProcesamiento.noProcesando()));
    }
  }

  void procesarImagenDeCamara({
    required CameraImage imagen,
    required CameraController controladorCamara,
    required CameraDescription camara,
  }) {
    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart

    final orientacionDeSensor = camara.sensorOrientation;
    InputImageRotation? rotacion;
    if (Platform.isIOS) {
      rotacion = InputImageRotationValue.fromRawValue(orientacionDeSensor);
    } else if (Platform.isAndroid) {
      var compensacionDeRotacion = controladorCamara.obtenerCompensacionDeRotacion();
      if (compensacionDeRotacion == null) return;
      if (camara.lensDirection == CameraLensDirection.front) {
        // Orientacion de la camara frontal
        compensacionDeRotacion = (orientacionDeSensor + compensacionDeRotacion) % 360;
      } else {
        // Orientacion de la camara trasera
        compensacionDeRotacion = (orientacionDeSensor - compensacionDeRotacion + 360) % 360;
      }
      rotacion = InputImageRotationValue.fromRawValue(compensacionDeRotacion);
    }
    if (rotacion == null) return;

    // get image format
    final format = InputImageFormatValue.fromRawValue(imagen.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null || (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return;
    }

    if ((Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return;
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

    // Procesar la imagen inmediatamente después de emitir

    if (state.estadoProcesamiento is _Procesando) {
      return;
    }

    if (state.estadoProcesamiento is _Completado) {
      return;
    }
    procesarImagen(imagenDeEntrada: imagenDeEntrada, camara: camara, imagenDeCamara: imagen);
  }
}

@freezed
class ReconocimientoFacialState with _$ReconocimientoFacialState {
  const factory ReconocimientoFacialState({
    required EstadoProcesamiento estadoProcesamiento,
    required OrientacionFacial orientacionFacialEsperada,
    required int contadorVerificacionesCorrectas,
  }) = _ReconocimientoFacialState;
}

@freezed
class EstadoProcesamiento with _$EstadoProcesamiento {
  const factory EstadoProcesamiento.procesando() = _Procesando;
  const factory EstadoProcesamiento.noProcesando() = _NoProcesando;
  const factory EstadoProcesamiento.completado({required File fotoVerificacionFacial}) = _Completado;
}
