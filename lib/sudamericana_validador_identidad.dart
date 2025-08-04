import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/cubits/validador_identidad_cubit.dart';
import 'package:sudamericana_validador_identidad/modelos/resultado_validacion.dart';
import 'package:sudamericana_validador_identidad/validador_identidad/validador_identidad.dart';

class SudamericanaValidadorIdentidad {
  late ValidadorIdentidad validadorIdentidad;
  late ValidadorIdentidadCubit cubit;

  SudamericanaValidadorIdentidad() {
    _init();
  }

  void _init() {
    cubit = ValidadorIdentidadCubit();
    validadorIdentidad = ValidadorIdentidad(cubit);
  }

  Future<ResultadoValidacion?> validarIdentidad(BuildContext context) async {
    return validadorIdentidad.validarIdentidad(context);
  }
}
