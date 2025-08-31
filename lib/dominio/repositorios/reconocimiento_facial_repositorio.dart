import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:sudamericana_validador_identidad/data/modelos/reconocimiento_facial/resultado_orientacion_facial.dart';

abstract class ReconocimientoFacialRepositorio {
  Future<ResultadoOrientacionFacial> reconocerOrientacionFacial(
    InputImage imagenDeEntrada,
  );
}
