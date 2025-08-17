import 'package:sudamericana_validador_identidad/data/modelos/bloque_texto.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_ocr/resultado_ocr.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_tipo_documento.dart';
import 'package:sudamericana_validador_identidad/data/servicios/ocr_servicio.dart';
import 'package:sudamericana_validador_identidad/dominio/repositorios/ocr_repositorio.dart';

class OcrRepositorioImpl implements OcrRepositorio {
  OcrRepositorioImpl({required OcrServicio ocrServicio})
    : _ocrServicio = ocrServicio;

  final OcrServicio _ocrServicio;

  @override
  ResultadoOcr? escanearDocumento(List<BloqueTexto> bloquesTexto) {
    final resultadoTipoDocumento = _ocrServicio.obtenerTipoDocumento(
      bloquesTexto,
    );
    try {
      if (resultadoTipoDocumento ==
          ResultadoTipoDocumento.cedulaComputarizadaAnverso()) {
        final emisionYExpiracion =
            bloquesTexto.firstWhere((b) => b.indice == 8).bloque.text;

        final emision = emisionYExpiracion.split('Expira').first.trim();
        final expiracion =
            'Expira ${emisionYExpiracion.split('Expira').last.trim()}';

        final diaEmision = emision.split('de').first;

        final expiracionCorregido =
            '${diaEmision}de ${expiracion.split('de')[1]}de${expiracion.split('de')[2]}';

        return ResultadoOcr.carnetComputarizadoAnverso(
          numero: bloquesTexto.firstWhere((b) => b.indice == 2).bloque.text,
          emision: emision,
          expiracion: expiracionCorregido,
        );
      }

      if (resultadoTipoDocumento ==
          ResultadoTipoDocumento.cedulaComputarizadaReverso()) {
        final nombre =
            bloquesTexto.firstWhere((b) => b.indice == 3).bloque.text.trim();

        return ResultadoOcr.carnetComputarizadoReverso(nombre: nombre);
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
