import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/tema/tema_sdk.dart';
import 'package:sudamericana_validador_identidad/data/modelos/datos_validacion.dart';
import 'package:sudamericana_validador_identidad/presentacion/cubits/validador_identidad_cubit.dart';
import 'package:sudamericana_validador_identidad/presentacion/pantallas/informacion_pantalla.dart';
import 'package:tensorflow_face_verification/tensorflow_face_verification.dart';

class SudamericanaValidadorIdentidad extends StatelessWidget {
  const SudamericanaValidadorIdentidad({
    super.key,
    required this.alValidarIdentidad,
    required this.alNoValidarIdentidad,
  });

  final Function(DatosValidacion) alValidarIdentidad;
  final Function(DatosValidacion) alNoValidarIdentidad;

  static Future<void> init({required String pathDelModelo}) async {
    await FaceVerification.init(modelPath: pathDelModelo);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidadorIdentidadCubit(),
      child: BlocListener<ValidadorIdentidadCubit, ValidadorIdentidadState>(
        listener: (context, state) {
          state.estadoValidacion.whenOrNull(
            validado: (validacionExitosa) {
              if (validacionExitosa) {
                alValidarIdentidad(state.datosValidacion);
              } else {
                alNoValidarIdentidad(state.datosValidacion);
              }
            },
          );
        },
        child: MaterialApp(
          theme: TemaSDK.temaClaro,
          debugShowCheckedModeBanner: false,
          home: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colores.fondo,
            child: InformacionPantalla(tipoInformacion: DocumentoAnverso()),
          ),
        ),
      ),
    );
  }
}
