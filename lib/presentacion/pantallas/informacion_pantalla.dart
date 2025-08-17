import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/compartido/imagenes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_documento.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/presentacion/pantallas/camara_carnet_pantalla.dart';
import 'package:sudamericana_validador_identidad/presentacion/pantallas/camara_verificacion_facial_pantalla.dart';

sealed class TipoInformacion {}

class DocumentoAnverso extends TipoInformacion {}

class DocumentoReverso extends TipoInformacion {}

class FotoFrontal extends TipoInformacion {}

class InformacionPantalla extends StatelessWidget {
  const InformacionPantalla({super.key, required this.tipoInformacion});

  final TipoInformacion tipoInformacion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colores.fondo,
        padding: EdgeInsets.all(Tamano.t32),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: Tamano.t32,
                  right: Tamano.t16,
                  bottom: Tamano.t24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Tamano.t32),
                  color: Colores.fondoEnPrincipal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      tipoInformacion is FotoFrontal
                          ? 'Ahora te tomaremos\nuna foto'
                          : 'Validación de\nIdentidad',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Tamano.t20,
                        fontWeight: FontWeight.bold,
                        color: Colores.textoPrincipal,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      switch (tipoInformacion) {
                        DocumentoAnverso() => Imagenes.carnetAnverso,
                        DocumentoReverso() => Imagenes.carnetReverso,
                        FotoFrontal() => Imagenes.fotoFrontal,
                      },
                      width: double.infinity,
                      height: tipoInformacion is FotoFrontal ? 200 : 256,
                    ),
                    Spacer(),
                    Text(
                      switch (tipoInformacion) {
                        DocumentoAnverso() =>
                          'Muestra el anverso de tu carnet\nen la misma posición de la imagen',
                        DocumentoReverso() =>
                          'Muestra el reverso de tu carnet\nen la misma posición de la imagen',
                        FotoFrontal() =>
                          'Busca un ambiente bien iluminado\ny no uses lentes ni sombrero',
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Tamano.t16,
                        color: Colores.textoPrincipal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Tamano.t20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            tipoInformacion is DocumentoAnverso
                                ? CamaraCarnetPantalla(
                                  orientacionDocumento:
                                      OrientacionDocumento.anverso(),
                                )
                                : tipoInformacion is DocumentoReverso
                                ? CamaraCarnetPantalla(
                                  orientacionDocumento:
                                      OrientacionDocumento.reverso(),
                                )
                                : CamaraVerificacionFacialPantalla(
                                  orientacionFacial: OrientacionFacial.centro(),
                                ),
                  ),
                );
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
