import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudamericana_validador_identidad/cubits/validador_identidad_cubit.dart';

class DialogValidarIdentidad extends StatelessWidget {
  const DialogValidarIdentidad({
    super.key,
    required this.validadorIdentidadCubit,
  });

  final ValidadorIdentidadCubit validadorIdentidadCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ValidadorIdentidadCubit>.value(
      value: validadorIdentidadCubit,
      child: BlocListener<ValidadorIdentidadCubit, ValidadorIdentidadState>(
        listener: (context, state) {
          if (state is ValidadorIdentidadError) {
            Navigator.pop(context, state.resultado);
          }

          if (state is ValidadorIdentidadFinalizado) {
            Navigator.pop(context, state.resultado);
          }
        },
        child: Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  validadorIdentidadCubit.finalizarValidacion();
                },
                child: Text('Validar Identidad'),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  validadorIdentidadCubit.causarError();
                },
                child: Text('Causar Error'),
              ),
              SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
