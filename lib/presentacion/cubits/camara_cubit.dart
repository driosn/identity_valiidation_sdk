import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'camara_cubit.freezed.dart';

class CamaraCubit extends Cubit<CamaraState> {
  CamaraCubit({required this.direccionCamara}) : super(CamaraState.inicial());

  final CameraLensDirection direccionCamara;

  void inicializarCamara({
    required Function(CameraImage) alProcesarImagen,
  }) async {
    emit(CamaraState.camaraInicializando());

    final estadoPermisoCamara = await Permission.camera.request();

    if (estadoPermisoCamara.isGranted) {
      try {
        final camaras = await availableCameras();

        final camaraSeleccionada = camaras.firstWhere(
          (camera) => camera.lensDirection == direccionCamara,
          orElse: () => camaras.first,
        );

        final controladorCamara = CameraController(
          camaraSeleccionada,
          ResolutionPreset.high,
          imageFormatGroup:
              Platform.isAndroid
                  ? ImageFormatGroup.nv21
                  : ImageFormatGroup.bgra8888,
          enableAudio: false,
        );

        await controladorCamara.initialize();
        await controladorCamara.startImageStream(alProcesarImagen);

        emit(
          CamaraState.camaraInicializada(
            controladorCamara: controladorCamara,
            camara: camaraSeleccionada,
          ),
        );
      } catch (e) {
        emit(CamaraState.camaraError(e.toString()));
      }
    } else {
      emit(CamaraState.camaraSinPermisos());
    }
  }

  void dispose() {
    state.whenOrNull(
      camaraInicializada:
          (controladorCamara, camara) => controladorCamara.dispose(),
    );
  }
}

@freezed
class CamaraState with _$CamaraState {
  const factory CamaraState.inicial() = Inicial;
  const factory CamaraState.camaraInicializando() = Inicializando;
  const factory CamaraState.camaraInicializada({
    required CameraController controladorCamara,
    required CameraDescription camara,
  }) = Inicializada;
  const factory CamaraState.camaraSinPermisos() = SinPermisos;
  const factory CamaraState.camaraError(String mensaje) = Error;
}
