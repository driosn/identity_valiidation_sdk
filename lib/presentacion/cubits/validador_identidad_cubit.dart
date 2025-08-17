import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sudamericana_validador_identidad/data/modelos/datos_validacion.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_ocr/resultado_ocr.dart';

part 'validador_identidad_cubit.freezed.dart';

class ValidadorIdentidadCubit extends Cubit<ValidadorIdentidadState> {
  ValidadorIdentidadCubit() : super(const ValidadorIdentidadState());

  void actualizarDatosValidacionSegunOcr(ResultadoOcr resultadoOcr) {
    resultadoOcr.when(
      carnetComputarizadoAnverso: (numero, emision, expiracion, tipoDocumento) {
        emit(
          state.copyWith(
            datosValidacion: state.datosValidacion.copyWith(
              numero: numero,
              emision: emision,
              expiracion: expiracion,
            ),
          ),
        );
      },
      carnetComputarizadoReverso: (nombre, tipoDocumento) {
        emit(
          state.copyWith(
            datosValidacion: state.datosValidacion.copyWith(nombre: nombre),
          ),
        );
      },
    );
  }

  void actualizarFoto(File file) {
    emit(
      state.copyWith(
        datosValidacion: state.datosValidacion.copyWith(fotoTempSrc: file.path),
      ),
    );
  }
}

@freezed
class ValidadorIdentidadState with _$ValidadorIdentidadState {
  const factory ValidadorIdentidadState({
    @Default(DatosValidacion()) DatosValidacion datosValidacion,
  }) = _ValidadorIdentidadState;
}
