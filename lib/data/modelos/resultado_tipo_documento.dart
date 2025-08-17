import 'package:freezed_annotation/freezed_annotation.dart';

part 'tipo_documento.freezed.dart';

@freezed
class ResultadoTipoDocumento with _$ResultadoTipoDocumento {
  const factory ResultadoTipoDocumento.cedulaComputarizadaAnverso() =
      _CedulaComputarizadaAnverso;
  const factory ResultadoTipoDocumento.cedulaComputarizadaReverso() =
      _CedulaComputarizadaReverso;
  const factory ResultadoTipoDocumento.ninguno() = _Ninguno;
}
