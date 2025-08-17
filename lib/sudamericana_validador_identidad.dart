import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/tema/tema_sdk.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/validador_identidad_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/pantallas/informacion_pantalla.dart';

class SudamericanaValidadorIdentidad extends StatelessWidget {
  const SudamericanaValidadorIdentidad({
    super.key,
    // required this.onEscaneoCompleto,
  });

  // final Function(DatosValidacion) onEscaneoCompleto;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidadorIdentidadCubit(),
      child: MaterialApp(
        theme: TemaSDK.temaClaro,
        home: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colores.fondo,
          child: InformacionPantalla(tipoInformacion: DocumentoAnverso()),
        ),
      ),
    );
  }
}
