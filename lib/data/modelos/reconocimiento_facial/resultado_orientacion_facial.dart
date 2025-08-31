import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';

part 'resultado_orientacion_facial.freezed.dart';

@freezed
class ResultadoOrientacionFacial with _$ResultadoOrientacionFacial {
  const factory ResultadoOrientacionFacial.caraEncontrada({
    required OrientacionFacial orientacionFacial,
  }) = _ResultadoOrientacionFacialCaraEncontrada;
  const factory ResultadoOrientacionFacial.caraNoEncontrada() =
      _ResultadoOrientacionFacialCaraNoEncontrada;
}
