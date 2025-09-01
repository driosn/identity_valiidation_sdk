import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sudamericana_validador_identidad/sudamericana_validador_identidad.dart';
import 'package:tesidentidadsdk/validacion_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SudamericanaValidadorIdentidad.init(pathDelModelo: "assets/modelos/facenet.tflite");

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Ejemplo validación mock', home: ValidacionScreen(), debugShowCheckedModeBanner: false);
  }
}
