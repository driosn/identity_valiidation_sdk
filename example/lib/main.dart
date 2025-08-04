import 'package:flutter/material.dart';
import 'package:tesidentidadsdk/dummy_screens/document_front_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo validación mock',
      home: DocumentFrontScreen(),
    );
  }
}
