import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/compartido/imagenes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_documento.dart';

class FotoCarnetInfoDialogo extends StatelessWidget {
  const FotoCarnetInfoDialogo({super.key, required this.orientacionDocumento});

  final OrientacionDocumento orientacionDocumento;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Tamano.t24,
            vertical: Tamano.t32,
          ),
          child: Column(
            children: [
              SizedBox(
                width: Tamano.t64,
                child: Image.asset(switch (orientacionDocumento) {
                  OrientacionDocumentoAnverso() =>
                    Imagenes.dialogoCarnetAnverso,
                  OrientacionDocumentoReverso() =>
                    Imagenes.dialogoCarnetReverso,
                }),
              ),

              SizedBox(height: Tamano.t32),
              Text(
                'Muestra el carnet en la posición del recuadro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colores.textoSecundario,
                  fontSize: Tamano.t20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Tamano.t8),
              Text(
                '¡No te muevas!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colores.textoSecundario),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
