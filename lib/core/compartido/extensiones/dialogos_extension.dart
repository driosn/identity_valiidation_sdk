import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_documento.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_facial.dart';
import 'package:sudamericana_validador_identidad/presentacion/dialogos/foto_carnet_info_dialogo.dart';
import 'package:sudamericana_validador_identidad/presentacion/dialogos/reconocimiento_facial_info_dialogo.dart';

extension DialogosExtension on BuildContext {
  void mostrarDialogoFotoCarnetInfo(OrientacionDocumento orientacionDocumento) {
    showDialog(
      context: this,
      builder:
          (context) => Dialog(
            backgroundColor: Colores.fondoDialogo,
            child: FotoCarnetInfoDialogo(orientacionDocumento: orientacionDocumento),
          ),
    );
  }

  void mostrarDialogoReconocimientoFacialInfo(OrientacionFacial orientacionFacial) {
    showDialog(
      context: this,
      barrierColor: Colores.transparente,
      builder:
          (context) => Dialog(
            backgroundColor: Colores.fondoDialogo,
            child: ReconocimientoFacialInfoDialogo(orientacionFacial: orientacionFacial),
          ),
    );
  }

  void mostrarDialogoReconocimientoFacialInfoError() {
    showDialog(
      context: this,
      barrierColor: Colores.transparente,
      builder:
          (context) => Dialog(
            child: ReconocimientoFacialInfoDialogo(
              orientacionFacial: OrientacionFacial.centro(),
              mostrarErrorEnVezDeOrientacion: true,
            ),
          ),
    );
  }
}
