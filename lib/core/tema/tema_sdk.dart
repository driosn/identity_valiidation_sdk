import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/core/compartido/colores.dart';
import 'package:sudamericana_validador_identidad/core/compartido/constantes.dart';
import 'package:sudamericana_validador_identidad/core/compartido/tamano.dart';

class TemaSDK {
  static ThemeData get temaClaro {
    return ThemeData(
      fontFamily: kFuenteDefault,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colores.botonPrincipalFondo,
          foregroundColor: Colores.botonPrincipalTexto,
          shadowColor: null,
          elevation: 0,
          minimumSize: Size(double.infinity, 48),
          textStyle: TextStyle(
            fontSize: Tamano.t16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: kFuenteDefault),
        displayMedium: TextStyle(fontFamily: kFuenteDefault),
        displaySmall: TextStyle(fontFamily: kFuenteDefault),
        headlineLarge: TextStyle(fontFamily: kFuenteDefault),
        headlineMedium: TextStyle(fontFamily: kFuenteDefault),
        headlineSmall: TextStyle(fontFamily: kFuenteDefault),
        titleLarge: TextStyle(fontFamily: kFuenteDefault),
        titleMedium: TextStyle(fontFamily: kFuenteDefault),
        titleSmall: TextStyle(fontFamily: kFuenteDefault),
        bodyLarge: TextStyle(fontFamily: kFuenteDefault),
        bodyMedium: TextStyle(fontFamily: kFuenteDefault),
        bodySmall: TextStyle(fontFamily: kFuenteDefault),
        labelLarge: TextStyle(fontFamily: kFuenteDefault),
        labelMedium: TextStyle(fontFamily: kFuenteDefault),
        labelSmall: TextStyle(fontFamily: kFuenteDefault),
      ),
    );
  }
}
