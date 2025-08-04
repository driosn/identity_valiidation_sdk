import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/cubits/validador_identidad_cubit.dart';
import 'package:sudamericana_validador_identidad/modelos/resultado_validacion.dart';
import 'package:sudamericana_validador_identidad/presentacion/dialog_validar_identidad.dart';

class ValidadorIdentidad {
  final ValidadorIdentidadCubit cubit;

  ValidadorIdentidad(this.cubit);

  Future<ResultadoValidacion?> validarIdentidad(BuildContext context) async {
    return await showDialog<ResultadoValidacion?>(
      context: context,
      builder:
          (context) => DialogValidarIdentidad(validadorIdentidadCubit: cubit),
    );
  }
}
