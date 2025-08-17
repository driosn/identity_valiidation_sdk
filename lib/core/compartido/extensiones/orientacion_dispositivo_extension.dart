import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

extension OrientacionDispositivoExtension on CameraController {
  int? obtenerCompensacionDeRotacion() {
    if (value.deviceOrientation == DeviceOrientation.portraitUp) {
      return 0;
    }

    if (value.deviceOrientation == DeviceOrientation.landscapeLeft) {
      return 90;
    }

    if (value.deviceOrientation == DeviceOrientation.portraitDown) {
      return 180;
    }

    if (value.deviceOrientation == DeviceOrientation.landscapeRight) {
      return 270;
    }

    return null;
  }
}
