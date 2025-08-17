import 'package:freezed_annotation/freezed_annotation.dart';

part 'orientacion_documento.freezed.dart';

@freezed
sealed class OrientacionDocumento with _$OrientacionDocumento {
  const factory OrientacionDocumento.anverso() = OrientacionDocumentoAnverso;
  const factory OrientacionDocumento.reverso() = OrientacionDocumentoReverso;
}
