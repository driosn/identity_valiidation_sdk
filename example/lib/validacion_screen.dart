import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sudamericana_validador_identidad/sudamericana_validador_identidad.dart';

class ValidacionScreen extends StatelessWidget {
  const ValidacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: SizedBox(height: kToolbarHeight),
      ),
      body: SudamericanaValidadorIdentidad(
        alValidarIdentidad: (datosValidacion) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => Scaffold(
                    body: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Card(
                              margin: const EdgeInsets.all(16),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.check_circle, color: Colors.green, size: 28),
                                        const SizedBox(width: 12),
                                        Text(
                                          'Validación Exitosa',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),

                                    _buildInfoRow('Nombre', datosValidacion.nombre),
                                    _buildInfoRow('Número', datosValidacion.numero),
                                    _buildInfoRow('Emisión', datosValidacion.emision),
                                    _buildInfoRow('Expiración', datosValidacion.expiracion),
                                    _buildInfoRow(
                                      'Similaridad',
                                      '${(datosValidacion.similaridad * 100).toStringAsFixed(2)}%',
                                    ),

                                    const SizedBox(height: 24),

                                    Text(
                                      'Imágenes Capturadas',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    const SizedBox(height: 16),

                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Foto del Documento',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child: Image.file(
                                                        File(datosValidacion.fotoPerfilDocumentoTempSrc),
                                                        fit: BoxFit.contain,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Selfie',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child: Image.file(
                                                        File(datosValidacion.fotoSelfieTempSrc),
                                                        fit: BoxFit.contain,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Documento Anverso',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child:
                                                          datosValidacion.fotoDocumentoAnversoTempSrc.isNotEmpty
                                                              ? Image.file(
                                                                File(datosValidacion.fotoDocumentoAnversoTempSrc),
                                                                fit: BoxFit.contain,
                                                                width: double.infinity,
                                                              )
                                                              : Container(
                                                                color: Colors.grey[100],
                                                                child: Center(
                                                                  child: Text(
                                                                    'No disponible',
                                                                    style: TextStyle(color: Colors.grey[500]),
                                                                  ),
                                                                ),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Documento Reverso',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child:
                                                          datosValidacion.fotoDocumentoReversoTempSrc.isNotEmpty
                                                              ? Image.file(
                                                                File(datosValidacion.fotoDocumentoReversoTempSrc),
                                                                fit: BoxFit.contain,
                                                                width: double.infinity,
                                                              )
                                                              : Container(
                                                                color: Colors.grey[100],
                                                                child: Center(
                                                                  child: Text(
                                                                    'No disponible',
                                                                    style: TextStyle(color: Colors.grey[500]),
                                                                  ),
                                                                ),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 16),

                                    ExpansionTile(
                                      title: Text(
                                        'Rutas de Archivos',
                                        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[600]),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              _buildPathInfo(
                                                'Foto Perfil Documento',
                                                datosValidacion.fotoPerfilDocumentoTempSrc,
                                              ),
                                              _buildPathInfo('Foto Selfie', datosValidacion.fotoSelfieTempSrc),
                                              _buildPathInfo(
                                                'Foto Documento Anverso',
                                                datosValidacion.fotoDocumentoAnversoTempSrc,
                                              ),
                                              _buildPathInfo(
                                                'Foto Documento Reverso',
                                                datosValidacion.fotoDocumentoReversoTempSrc,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          );
        },
        alNoValidarIdentidad: (datosValidacion) {
          print('NO SE PUDO VALIDAR LA IDENTIDAD');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => Scaffold(
                    body: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Card(
                              margin: const EdgeInsets.all(16),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.error, color: Colors.red, size: 28),
                                        const SizedBox(width: 12),
                                        Text(
                                          'Validación Fallida',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),

                                    _buildInfoRow('Nombre', datosValidacion.nombre),
                                    _buildInfoRow('Número', datosValidacion.numero),
                                    _buildInfoRow('Emisión', datosValidacion.emision),
                                    _buildInfoRow('Expiración', datosValidacion.expiracion),
                                    _buildInfoRow(
                                      'Similaridad',
                                      '${(datosValidacion.similaridad * 100).toStringAsFixed(2)}%',
                                    ),

                                    const SizedBox(height: 24),

                                    Text(
                                      'Imágenes Capturadas',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    const SizedBox(height: 16),

                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Foto del Documento',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child: Image.file(
                                                        File(datosValidacion.fotoPerfilDocumentoTempSrc),
                                                        fit: BoxFit.contain,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Selfie',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child: Image.file(
                                                        File(datosValidacion.fotoSelfieTempSrc),
                                                        fit: BoxFit.contain,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Documento Anverso',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child:
                                                          datosValidacion.fotoDocumentoAnversoTempSrc.isNotEmpty
                                                              ? Image.file(
                                                                File(datosValidacion.fotoDocumentoAnversoTempSrc),
                                                                fit: BoxFit.contain,
                                                                width: double.infinity,
                                                              )
                                                              : Container(
                                                                color: Colors.grey[100],
                                                                child: Center(
                                                                  child: Text(
                                                                    'No disponible',
                                                                    style: TextStyle(color: Colors.grey[500]),
                                                                  ),
                                                                ),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Documento Reverso',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.grey[300]!),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child:
                                                          datosValidacion.fotoDocumentoReversoTempSrc.isNotEmpty
                                                              ? Image.file(
                                                                File(datosValidacion.fotoDocumentoReversoTempSrc),
                                                                fit: BoxFit.contain,
                                                                width: double.infinity,
                                                              )
                                                              : Container(
                                                                color: Colors.grey[100],
                                                                child: Center(
                                                                  child: Text(
                                                                    'No disponible',
                                                                    style: TextStyle(color: Colors.grey[500]),
                                                                  ),
                                                                ),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 16),

                                    ExpansionTile(
                                      title: Text(
                                        'Rutas de Archivos',
                                        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[600]),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              _buildPathInfo(
                                                'Foto Perfil Documento',
                                                datosValidacion.fotoPerfilDocumentoTempSrc,
                                              ),
                                              _buildPathInfo('Foto Selfie', datosValidacion.fotoSelfieTempSrc),
                                              _buildPathInfo(
                                                'Foto Documento Anverso',
                                                datosValidacion.fotoDocumentoAnversoTempSrc,
                                              ),
                                              _buildPathInfo(
                                                'Foto Documento Reverso',
                                                datosValidacion.fotoDocumentoReversoTempSrc,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text('$label:', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700])),
          ),
          Expanded(child: Text(value, style: TextStyle(color: Colors.grey[800]))),
        ],
      ),
    );
  }

  Widget _buildPathInfo(String label, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700], fontSize: 14)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(path, style: TextStyle(color: Colors.grey[600], fontSize: 12, fontFamily: 'monospace')),
          ),
        ],
      ),
    );
  }
}
