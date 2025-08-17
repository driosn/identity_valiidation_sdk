class Error {
  final String mensaje;

  Error(this.mensaje);
}

class ErrorInesperado extends Error {
  ErrorInesperado() : super('Error de prueba');
}
