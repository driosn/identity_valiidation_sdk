import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sudamericana_validador_identidad/data/modelos/datos_validacion.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_ocr/resultado_ocr.dart';

part 'validador_identidad_cubit.freezed.dart';

class ValidadorIdentidadCubit extends Cubit<ValidadorIdentidadState> {
  ValidadorIdentidadCubit() : super(const ValidadorIdentidadState());

  void actualizarDatosValidacionSegunOcr(ResultadoOcr resultadoOcr, File fotoDocumento) {
    resultadoOcr.when(
      carnetComputarizadoAnverso: (String numero, String emision, String expiracion, _) {
        emit(
          state.copyWith(
            datosValidacion: state.datosValidacion.copyWith(
              numero: numero,
              emision: emision,
              expiracion: expiracion,
              fotoDocumentoAnversoTempSrc: fotoDocumento.path,
            ),
          ),
        );
      },
      carnetComputarizadoReverso: (String nombre, _) {
        emit(
          state.copyWith(
            datosValidacion: state.datosValidacion.copyWith(
              nombre: nombre,
              fotoDocumentoReversoTempSrc: fotoDocumento.path,
            ),
          ),
        );
      },
    );
  }

  void actualizarFotoPerfilDocumento(File file) {
    emit(state.copyWith(datosValidacion: state.datosValidacion.copyWith(fotoPerfilDocumentoTempSrc: file.path)));
  }

  void actualizarFotoSelfie(File file) {
    emit(state.copyWith(datosValidacion: state.datosValidacion.copyWith(fotoSelfieTempSrc: file.path)));
  }

  void actualizarSimilaridad(double similaridad) {
    emit(state.copyWith(datosValidacion: state.datosValidacion.copyWith(similaridad: similaridad)));
  }

  void emitirEstadoValidacion(EstadoValidacion estadoValidacion) {
    emit(state.copyWith(estadoValidacion: estadoValidacion));
  }
}

@freezed
class ValidadorIdentidadState with _$ValidadorIdentidadState {
  const factory ValidadorIdentidadState({
    @Default(DatosValidacion()) DatosValidacion datosValidacion,
    @Default(EstadoValidacion.inicial()) EstadoValidacion estadoValidacion,
  }) = _ValidadorIdentidadState;
}

@freezed
class EstadoValidacion with _$EstadoValidacion {
  const factory EstadoValidacion.inicial() = Inicial;
  const factory EstadoValidacion.validando() = Validando;
  const factory EstadoValidacion.validado({required bool validacionExitosa}) = Validado;
  const factory EstadoValidacion.error() = Error;
}
