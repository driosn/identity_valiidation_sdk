import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/compartido/imagenes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';

class ReconocimientoFacialInfoDialogo extends StatefulWidget {
  const ReconocimientoFacialInfoDialogo({
    super.key,
    required this.orientacionFacial,
    this.mostrarErrorEnVezDeOrientacion = false,
  });

  final OrientacionFacial orientacionFacial;
  final bool? mostrarErrorEnVezDeOrientacion;

  @override
  State<ReconocimientoFacialInfoDialogo> createState() => _ReconocimientoFacialInfoDialogoState();
}

class _ReconocimientoFacialInfoDialogoState extends State<ReconocimientoFacialInfoDialogo> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2500));
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

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
                width: Tamano.t90,
                child:
                    widget.mostrarErrorEnVezDeOrientacion ?? false
                        ? Image.asset(Imagenes.infoFacialCentro)
                        : Image.asset(switch (widget.orientacionFacial) {
                          OrientacionFacialCentro() => Imagenes.infoFacialCentro,
                          OrientacionFacialIzquierda() => Imagenes.infoFacialIzquierda,
                          OrientacionFacialDerecha() => Imagenes.infoFacialDerecha,
                        }),
              ),
              SizedBox(height: Tamano.t8),
              Text(
                widget.mostrarErrorEnVezDeOrientacion ?? false
                    ? 'No fue posible realizar la verificación'
                    : switch (widget.orientacionFacial) {
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
