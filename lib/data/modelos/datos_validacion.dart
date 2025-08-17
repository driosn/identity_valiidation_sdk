import 'package:freezed_annotation/freezed_annotation.dart';

part 'datos_validacion.freezed.dart';

@freezed
class DatosValidacion with _$DatosValidacion {
  const factory DatosValidacion({
    @Default('') String nombre,
    @Default('') String numero,
    @Default('') String emision,
    @Default('') String expiracion,
    @Default('') String fotoTempSrc,
    @Default('') String firmaTempSrc,
  }) = _DatosValidacion;
}

///
/// Agregar datos extra
///
// Foto Documento Anverso
// Foto Documento Reverso
// Foto Carnet
// Foto Selfie
