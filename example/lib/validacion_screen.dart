import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/sudamericana_validador_identidad.dart';

class ValidacionScreen extends StatelessWidget {
  const ValidacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo validación mock')),
      body: const Center(child: Text('Ejemplo validación mock')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final validadorIdentidad = SudamericanaValidadorIdentidad();

          final resultado = await validadorIdentidad.validarIdentidad(context);

          ///
          /// En caso de que el resultado sea null, se asume que el usuario cerró
          /// el dialogo sin exito o error.
          ///
          if (resultado == null) {
            print('Dialog validación cerrado');
            return;
          }

          ///
          /// En caso de que el resultado sea exitoso, se asume que el usuario
          /// validó la identidad correctamente.
          ///
          if (resultado.exito) {
            if (kDebugMode) {
              print(resultado.datos!);
            }
            return;
          }
          ///
          /// En caso de que el resultado no sea exitoso, se asume que el usuario
          /// tuvo un error al validar la identidad.
          ///
          else {
            if (kDebugMode) {
              print(resultado.error!.mensaje);
            }
            return;
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
