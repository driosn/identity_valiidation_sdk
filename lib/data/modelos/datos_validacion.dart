import 'package:freezed_annotation/freezed_annotation.dart';

part 'datos_validacion.freezed.dart';

@freezed
class DatosValidacion with _$DatosValidacion {
  const factory DatosValidacion({
    @Default('') String nombre,
    @Default('') String numero,
    @Default('') String emision,
    @Default('') String expiracion,
    @Default('') String fotoPerfilDocumentoTempSrc,
    @Default('') String firmaTempSrc,
    @Default('') String fotoDocumentoAnversoTempSrc,
    @Default('') String fotoDocumentoReversoTempSrc,
    @Default('') String fotoSelfieTempSrc,
    @Default(0) double similaridad,
  }) = _DatosValidacion;
}
