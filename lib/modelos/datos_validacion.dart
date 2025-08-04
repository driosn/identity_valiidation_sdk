class DatosValidacion {
  final String nombre;
  final String numero;
  final String emision;
  final String expiracion;
  final String fotoTempSrc;
  final String firmaTempSrc;

  DatosValidacion({
    required this.nombre,
    required this.numero,
    required this.emision,
    required this.expiracion,
    required this.fotoTempSrc,
    required this.firmaTempSrc,
  });

  @override
  String toString() {
    return 'DatosValidacion(nombre: $nombre, numero: $numero, emision: $emision, expiracion: $expiracion, fotoTempSrc: $fotoTempSrc, firmaTempSrc: $firmaTempSrc)';
  }
}
