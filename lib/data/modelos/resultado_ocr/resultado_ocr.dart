import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_documento.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_tipo_documento.dart';

part 'resultado_ocr.freezed.dart';

@freezed
sealed class ResultadoOcr with _$ResultadoOcr {
  const factory ResultadoOcr.carnetComputarizadoAnverso({
    required String numero,
    required String emision,
    required String expiracion,
    @Default(OrientacionDocumento.anverso()) OrientacionDocumento orientacion,
  }) = _ResultadoOcrCarnetComputarizadoAnverso;

  const factory ResultadoOcr.carnetComputarizadoReverso({
    required String nombre,
    @Default(OrientacionDocumento.reverso()) OrientacionDocumento orientacion,
  }) = _ResultadoOcrCarnetComputarizadoReverso;
}
