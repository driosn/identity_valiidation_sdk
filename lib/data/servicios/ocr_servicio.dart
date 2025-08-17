import 'package:sudamericana_validador_identidad/data/modelos/bloque_texto.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_tipo_documento.dart';

class OcrServicio {
  ResultadoTipoDocumento obtenerTipoDocumento(List<BloqueTexto> bloquesTexto) {
    final esCedulaComputarizadaAnverso = _verificarEsCedulaComputarizadaAnverso(
      bloquesTexto,
    );

    if (esCedulaComputarizadaAnverso) {
      return const ResultadoTipoDocumento.cedulaComputarizadaAnverso();
    }

    final esCedulaComputarizadaReverso = _verificarEsCedulaComputarizadaReverso(
      bloquesTexto,
    );

    if (esCedulaComputarizadaReverso) {
      return const ResultadoTipoDocumento.cedulaComputarizadaReverso();
    }

    return const ResultadoTipoDocumento.ninguno();
  }

  bool _verificarEsCedulaComputarizadaAnverso(List<BloqueTexto> bloquesTexto) {
    bool noEstaVacio = true;
    bool condicion0 = false;
    bool condicion1 = false;
    bool condicion2 = false;
    bool condicion8 = false;

    for (final bloque in bloquesTexto) {
      if (bloque.bloque.text.isEmpty) {
        noEstaVacio = false;
        break;
      }

      if (bloque.indice == 0 && bloque.bloque.text.contains('No')) {
        condicion0 = true;
      }

      if (bloque.indice == 1 &&
          bloque.bloque.text.toLowerCase().contains(
            'estado plurinacional de bolivia',
          )) {
        condicion1 = true;
      }

      if (bloque.indice == 2 && int.tryParse(bloque.bloque.text) != null) {
        condicion2 = true;
      }

      if (bloque.indice == 8 &&
          bloque.bloque.text.toLowerCase().contains('emitida') &&
          bloque.bloque.text.toLowerCase().contains('expira')) {
        condicion8 = true;
      }
    }

    return noEstaVacio && condicion0 && condicion1 && condicion2 && condicion8;
  }

  bool _verificarEsCedulaComputarizadaReverso(List<BloqueTexto> bloquesTexto) {
    bool condicion1 = false;
    bool condicion2 = false;
    bool condicion4 = false;

    for (final bloque in bloquesTexto) {
      if (bloque.bloque.text.isEmpty) {
        return false;
      }

      if (bloque.indice == 1 && int.tryParse(bloque.bloque.text) != null) {
        condicion1 = true;
      }

      if (bloque.indice == 2 && bloque.bloque.text.toLowerCase() == 'a:') {
        condicion2 = true;
      }

      if (bloque.indice == 4 &&
          bloque.bloque.text.toLowerCase().contains('nacido')) {
        condicion4 = true;
      }
    }
    return condicion1 && condicion2 && condicion4;
  }
}
