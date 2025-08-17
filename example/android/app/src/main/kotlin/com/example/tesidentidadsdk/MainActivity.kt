package com.example.tesidentidadsdk

import io.flutter.embedding.android.FlutterActivity
import android.util.Log

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Suprimir warnings del sistema que no afectan la funcionalidad
        Log.w("MainActivity", "Configurando logging para suprimir warnings del sistema")
    }
}
