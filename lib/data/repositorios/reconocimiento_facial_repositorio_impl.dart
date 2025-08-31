import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart' as ml_kit;
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/data/modelos/reconocimiento_facial/resultado_orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/dominio/repositorios/reconocimiento_facial_repositorio.dart';

class ReconocimientoFacialRepositorioImpl implements ReconocimientoFacialRepositorio {
  const ReconocimientoFacialRepositorioImpl({required ml_kit.FaceDetector detectorFacial})
    : _detectorFacial = detectorFacial;

  final ml_kit.FaceDetector _detectorFacial;

  final double _rotacionHorizontalMinimaIzquierda = 35;
  final double _rotacionHorizontalMinimaDerecha = -35;
  final double _rotacionHorizontalMinimaCentro = -3;
  final double _rotacionHorizontalMaximaCentro = 3;

  @override
  Future<ResultadoOrientacionFacial> reconocerOrientacionFacial(ml_kit.InputImage imagenDeEntrada) async {
    try {
      final caras = await _detectorFacial.processImage(imagenDeEntrada);

      if (caras.length == 1) {
        final cara = caras.first;

        final rotacionHorizontal = cara.headEulerAngleY;

        if (rotacionHorizontal != null &&
            rotacionHorizontal > _rotacionHorizontalMinimaCentro &&
            rotacionHorizontal < _rotacionHorizontalMaximaCentro) {
          return ResultadoOrientacionFacial.caraEncontrada(orientacionFacial: OrientacionFacial.centro());
        }

        if (rotacionHorizontal != null && rotacionHorizontal < _rotacionHorizontalMinimaDerecha) {
          return ResultadoOrientacionFacial.caraEncontrada(orientacionFacial: OrientacionFacial.derecha());
        }

        if (rotacionHorizontal != null && rotacionHorizontal > _rotacionHorizontalMinimaIzquierda) {
          return ResultadoOrientacionFacial.caraEncontrada(orientacionFacial: OrientacionFacial.izquierda());
        }

        return ResultadoOrientacionFacial.caraNoEncontrada();
      }

      return ResultadoOrientacionFacial.caraNoEncontrada();
    } catch (e) {
      return ResultadoOrientacionFacial.caraNoEncontrada();
    }
  }
}
