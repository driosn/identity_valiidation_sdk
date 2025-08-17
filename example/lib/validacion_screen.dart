import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/sudamericana_validador_identidad.dart';

class ValidacionScreen extends StatelessWidget {
  const ValidacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo validación mock')),
      body: SudamericanaValidadorIdentidad(),
    );
  }
}
