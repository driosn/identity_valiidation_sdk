import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tensorflow_face_verification/tensorflow_face_verification.dart';

part 'verificador_similitud_cubit.freezed.dart';

class VerificadorSimilitudCubit extends Cubit<VerificadorSimilitudState> {
  VerificadorSimilitudCubit() : super(VerificadorSimilitudState.inicial());

  final double _umbralDeSimilaridad = 0.6;

  void verificarSiEsLaMismaPersona({required File imagenA, required File imagenB}) async {
    try {
      emit(VerificadorSimilitudState.verificando());

      double similaridad = await FaceVerification.instance.getSimilarityScoreFromFile(imagenA, imagenB);

      bool esLaMismaPersona = similaridad >= _umbralDeSimilaridad;
      emit(
        VerificadorSimilitudState.resultado(
          esLaMismaPersona: esLaMismaPersona,
          similaridad: similaridad,
          imagenA: imagenA,
          imagenB: imagenB,
        ),
      );
    } catch (e) {
      emit(
        VerificadorSimilitudState.resultado(
          esLaMismaPersona: false,
          similaridad: 0,
          imagenA: imagenA,
          imagenB: imagenB,
        ),
      );
    }
  }
}

@freezed
class VerificadorSimilitudState with _$VerificadorSimilitudState {
  const factory VerificadorSimilitudState.inicial() = _VerificadorSimilitudStateInicial;
  const factory VerificadorSimilitudState.verificando() = _VerificadorSimilitudStateVerificando;
  const factory VerificadorSimilitudState.resultado({
    required bool esLaMismaPersona,
    required double similaridad,
    required File imagenA,
    required File imagenB,
  }) = _VerificadorSimilitudStateResultado;
}
