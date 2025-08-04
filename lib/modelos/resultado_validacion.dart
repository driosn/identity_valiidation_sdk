import 'package:sudamericana_validador_identidad/error/error.dart';
import 'package:sudamericana_validador_identidad/modelos/datos_validacion.dart';

class ResultadoValidacion {
  bool exito;

  ///
  /// El atributo de error no será nulo cuando éxito sea false
  ///
  Error? error;

  ///
  /// El atributo de datos no será nulo cuando éxito sea true
  ///
  DatosValidacion? datos;

  ResultadoValidacion({required this.exito, this.error, this.datos});
}
