import 'package:sudamericana_validador_identidad/core/error/error.dart';
import 'package:sudamericana_validador_identidad/data/modelos/datos_validacion.dart';

sealed class ResultadoValidacion {
  // bool exito;

  // ///
  // /// El atributo de error no será nulo cuando éxito sea false
  // ///
  // Error? error;

  // ///
  // /// El atributo de datos no será nulo cuando éxito sea true
  // ///
  // DatosValidacion? datos;

  ResultadoValidacion();
}

class ValidacionExitosa extends ResultadoValidacion {
  final DatosValidacion datos;

  ValidacionExitosa({required this.datos});
}

class ValidacionFallida extends ResultadoValidacion {
  final Error error;

  ValidacionFallida({required this.error});
}
