import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:sudamericana_validador_identidad/dominio/repositorios/conversor_imagenes_repositorio.dart';

class ConversorImagenesRepositorioImpl implements ConversorImagenesRepositorio {
  @override
  Future<File> convertirCameraImageNv21AFile(CameraImage cameraImage) async {
    try {
      // Obtener los bytes del primer plano (Y channel)
      final plane = cameraImage.planes.first;
      final bytes = plane.bytes;

      // Escribir bytes al archivo
      final file = nv21ToFile(bytes, cameraImage.width, cameraImage.height);

      return file;
    } catch (e) {
      throw Exception('Error al convertir CameraImage a File: $e');
    }
  }

  Future<File> nv21ToFile(Uint8List nv21, int width, int height) async {
    try {
      // Convertir NV21 → RGB
      img.Image rgbImage = _convertirNV21AImagen(nv21, width, height);

      // Codificar a PNG
      rgbImage = img.copyRotate(rgbImage, angle: -90);
      final pngBytes = img.encodePng(rgbImage);

      // Guardar en archivo
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/camera_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);
      return file;
    } catch (e) {
      throw Exception('Error al convertir CameraImage a File: $e');
    }
  }

  img.Image _convertirNV21AImagen(Uint8List bytes, int width, int height) {
    final int tamanoFrame = width * height;
    final img.Image image = img.Image(width: width, height: height);

    for (int j = 0, yp = 0; j < height; j++) {
      int uvp = tamanoFrame + (j >> 1) * width;
      int u = 0, v = 0;

      for (int i = 0; i < width; i++, yp++) {
        int y = (0xff & bytes[yp]) - 16;
        if (y < 0) y = 0;

        if ((i & 1) == 0) {
          v = (0xff & bytes[uvp++]) - 128;
          u = (0xff & bytes[uvp++]) - 128;
        }

        int y1192 = 1192 * y;
        int r = (y1192 + 1634 * v);
        int g = (y1192 - 833 * v - 400 * u);
        int b = (y1192 + 2066 * u);

        r = (r < 0 ? 0 : (r > 262143 ? 262143 : r)) >> 10;
        g = (g < 0 ? 0 : (g > 262143 ? 262143 : g)) >> 10;
        b = (b < 0 ? 0 : (b > 262143 ? 262143 : b)) >> 10;

        image.setPixelRgba(i, j, r, g, b, 255);
      }
    }
    return image;
  }
}
