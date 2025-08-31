import 'dart:io';

import 'package:camera/camera.dart';

abstract class ConversorImagenesRepositorio {
  Future<File> convertirCameraImageNv21AFile(CameraImage cameraImage);
}
