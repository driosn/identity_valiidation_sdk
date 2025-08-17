import 'package:sudamericana_validador_identidad/data/modelos/bloque_texto.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_ocr/resultado_ocr.dart';

abstract class OcrRepositorio {
  ResultadoOcr? escanearDocumento(List<BloqueTexto> bloquesTexto);
}
