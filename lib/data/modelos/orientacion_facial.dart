import 'package:freezed_annotation/freezed_annotation.dart';

part 'orientacion_facial.freezed.dart';

@freezed
sealed class OrientacionFacial with _$OrientacionFacial {
  const factory OrientacionFacial.izquierda() = OrientacionFacialIzquierda;
  const factory OrientacionFacial.derecha() = OrientacionFacialDerecha;
  const factory OrientacionFacial.centro() = OrientacionFacialCentro;
}
