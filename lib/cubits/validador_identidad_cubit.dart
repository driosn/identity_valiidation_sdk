import 'package:bloc/bloc.dart';
import 'package:sudamericana_validador_identidad/error/error.dart';
import 'package:sudamericana_validador_identidad/modelos/datos_validacion.dart';
import 'package:sudamericana_validador_identidad/modelos/resultado_validacion.dart';

class ValidadorIdentidadCubit extends Cubit<ValidadorIdentidadState> {
  ValidadorIdentidadCubit() : super(ValidadorIdentidadInicial());

  void finalizarValidacion() {
    emit(ValidadorIdentidadInicial());
    final mockResultado = ResultadoValidacion(
      exito: true,
      error: null,
      datos: DatosValidacion(
        nombre: 'Juan Perez',
        numero: '1234567',
        emision: '2020-01-01',
        expiracion: '2025-01-01',
        fotoTempSrc: 'assets/images/foto_mock.jpg',
        firmaTempSrc: 'assets/images/firma_mock.jpg',
      ),
    );
    emit(ValidadorIdentidadFinalizado(mockResultado));
  }

  void causarError() {
    final mockResultado = ResultadoValidacion(
      exito: false,
      error: ErrorInesperado(),
      datos: null,
    );
    emit(ValidadorIdentidadError(mockResultado));
  }
}

sealed class ValidadorIdentidadState {}

class ValidadorIdentidadInicial extends ValidadorIdentidadState {}

class ValidadorIdentidadValidando extends ValidadorIdentidadState {}

class ValidadorIdentidadFinalizado extends ValidadorIdentidadState {
  final ResultadoValidacion resultado;

  ValidadorIdentidadFinalizado(this.resultado);
}

class ValidadorIdentidadError extends ValidadorIdentidadState {
  final ResultadoValidacion resultado;

  ValidadorIdentidadError(this.resultado);
}
