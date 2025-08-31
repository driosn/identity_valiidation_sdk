import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/compartido/imagenes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';

class ReconocimientoFacialInfoDialogo extends StatelessWidget {
  const ReconocimientoFacialInfoDialogo({
    super.key,
    required this.orientacionFacial,
    this.mostrarErrorEnVezDeOrientacion = false,
  });

  final OrientacionFacial orientacionFacial;
  final bool? mostrarErrorEnVezDeOrientacion;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: Tamano.t24, vertical: Tamano.t24),
          child: Column(
            children: [
              SizedBox(
                width: Tamano.t64,
                child:
                    mostrarErrorEnVezDeOrientacion ?? false
                        ? Image.asset(Imagenes.infoFacialCentro)
                        : Image.asset(switch (orientacionFacial) {
                          OrientacionFacialCentro() => Imagenes.infoFacialCentro,
                          OrientacionFacialIzquierda() => Imagenes.infoFacialIzquierda,
                          OrientacionFacialDerecha() => Imagenes.infoFacialDerecha,
                        }),
              ),
              SizedBox(height: Tamano.t8),
              Text(
                mostrarErrorEnVezDeOrientacion ?? false
                    ? 'No fue posible realizar la verificación'
                    : switch (orientacionFacial) {
                      OrientacionFacialCentro() => 'Acerca tu rostro\na la cámara',
                      OrientacionFacialIzquierda() => 'Mueve tu rostro\nen la posición indicada',
                      OrientacionFacialDerecha() => 'Mueve tu rostro\nen la posición indicada',
                    },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colores.textoSecundario, fontSize: Tamano.t24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
