import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:sudamericana_validador_identidad/core/compartido/extensiones/conversor_nv21_extension.dart';
import 'package:sudamericana_validador_identidad/core/compartido/extensiones/orientacion_dispositivo_extension.dart';
import 'package:sudamericana_validador_identidad/data/modelos/bloque_texto.dart';
import 'package:sudamericana_validador_identidad/data/modelos/orientacion_documento.dart';
import 'package:sudamericana_validador_identidad/data/modelos/resultado_ocr/resultado_ocr.dart';
import 'package:sudamericana_validador_identidad/dominio/repositorios/ocr_repositorio.dart';

part 'ml_kit_cubit.freezed.dart';

class MLKitCubit extends Cubit<MLKitState> {
  MLKitCubit({
    required this.ocrRepositorio,
    required OrientacionDocumento orientacionEsperada,
  }) : super(
         MLKitState(
           inputImage: null,
           estadoProcesamiento: EstadoProcesamiento.noProcesando(),
           customPaint: null,
           bloquesTexto: [],
           orientacionEsperada: orientacionEsperada,
         ),
       );

  final OcrRepositorio ocrRepositorio;

  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  void procesarImagen({
    required InputImage imagenDeEntrada,
    required CameraDescription camara,
  }) async {
    emit(state.copyWith(estadoProcesamiento: EstadoProcesamiento.procesando()));

    final textoReconocido = await _textRecognizer.processImage(imagenDeEntrada);

    print(textoReconocido.text);

    // final recognizedText = await _textRecognizer.processImage(inputImage);
    // if (inputImage.metadata?.size != null &&
    //     inputImage.metadata?.rotation != null) {
    //   final painter = TextRecognizerPainter(
    //     recognizedText,
    //     inputImage.metadata!.size,
    //     inputImage.metadata!.rotation,
    //     _cameraLensDirection,
    //   );
    //   _customPaint = CustomPaint(painter: painter);
    // } else {
    //   _text = 'Recognized text:\n\n${recognizedText.text}';
    //   // TODO: set _customPaint to draw boundingRect on top of image
    //   _customPaint = null;

    // }

    if (imagenDeEntrada.metadata?.size != null &&
        imagenDeEntrada.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(
        textoReconocido,
        imagenDeEntrada.metadata!.size,
        // imagenDeEntrada.metadata!.rotation,
        InputImageRotation.rotation90deg,
        // imagenDeEntrada.metadata!.rotation,
        camara.lensDirection,
      );

      final bloquesTexto = <BloqueTexto>[];

      for (int i = 0; i < textoReconocido.blocks.length; i++) {
        final bloque = textoReconocido.blocks[i];
        bloquesTexto.add(BloqueTexto(indice: i, bloque: bloque));
      }

      print('=========================');
      for (final bloque in bloquesTexto) {
        print('Bloque ${bloque.indice}: ${bloque.bloque.text}');
      }
      print('=========================');

      final resultadoOcr = ocrRepositorio.escanearDocumento(bloquesTexto);

      if (resultadoOcr != null) {
        if (resultadoOcr.orientacion == state.orientacionEsperada) {
          emit(
            state.copyWith(
              estadoProcesamiento: EstadoProcesamiento.completado(
                resultadoOcr: resultadoOcr,
              ),
            ),
          );
          return;
        }
      }

      emit(
        state.copyWith(
          customPaint: CustomPaint(painter: painter),
          bloquesTexto: bloquesTexto,
        ),
      );
    }

    emit(
      state.copyWith(estadoProcesamiento: EstadoProcesamiento.noProcesando()),
    );
  }

  void procesarImagenDeCamara({
    required CameraImage imagen,
    required CameraController controladorCamara,
    required CameraDescription camara,
  }) {
    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart

    final orientacionDeSensor = camara.sensorOrientation;
    InputImageRotation? rotacion;
    if (Platform.isIOS) {
      rotacion = InputImageRotationValue.fromRawValue(orientacionDeSensor);
    } else if (Platform.isAndroid) {
      var compensacionDeRotacion =
          controladorCamara.obtenerCompensacionDeRotacion();
      if (compensacionDeRotacion == null) return;
      if (camara.lensDirection == CameraLensDirection.front) {
        // front-facing
        compensacionDeRotacion =
            (orientacionDeSensor + compensacionDeRotacion) % 360;
      } else {
        // back-facing
        compensacionDeRotacion =
            (orientacionDeSensor - compensacionDeRotacion + 360) % 360;
      }
      rotacion = InputImageRotationValue.fromRawValue(compensacionDeRotacion);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotacion == null) return;
    // print('final rotation: $rotation');

    final plano = imagen.planes.firstOrNull;
    if (plano == null) {
      return;
    }

    // get image format
    final format = InputImageFormatValue.fromRawValue(imagen.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return;
    }

    // since format is constraint to nv21 or bgra8888, both only have one plane
    // if (imagen.planes.length != 1) return;
    // final plano = imagen.planes.first;

    final Uint8List bytes;
    if (Platform.isAndroid) {
      bytes = imagen.getNv21Uint8List();
    } else {
      final allBytes = WriteBuffer();
      for (final plane in imagen.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      bytes = allBytes.done().buffer.asUint8List();
    }

    // compose InputImage using bytes
    final imagenDeEntrada = InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(imagen.width.toDouble(), imagen.height.toDouble()),
        // rotation: rotacion, // used only in Android
        rotation: InputImageRotation.rotation90deg, // used only in Android
        format:
            Platform.isAndroid
                ? InputImageFormat.nv21
                : format, // used only in iOS
        bytesPerRow: plano.bytesPerRow, // used only in iOS
      ),
    );

    // emit(state.copyWith(inputImage: imagenDeEntrada));

    // Procesar la imagen inmediatamente después de emitir
    if (state.estadoProcesamiento is _Procesando) {
      return;
    }

    if (state.estadoProcesamiento is _Completado) {
      return;
    }
    procesarImagen(imagenDeEntrada: imagenDeEntrada, camara: camara);
  }
}

@freezed
class MLKitState with _$MLKitState {
  const factory MLKitState({
    required InputImage? inputImage,
    required EstadoProcesamiento estadoProcesamiento,
    required CustomPaint? customPaint,
    required List<BloqueTexto> bloquesTexto,
    required OrientacionDocumento orientacionEsperada,
  }) = _MlKitState;
}

@freezed
class EstadoProcesamiento with _$EstadoProcesamiento {
  const factory EstadoProcesamiento.procesando() = _Procesando;
  const factory EstadoProcesamiento.noProcesando() = _NoProcesando;
  const factory EstadoProcesamiento.completado({
    required ResultadoOcr resultadoOcr,
  }) = _Completado;
}

class TextRecognizerPainter extends CustomPainter {
  TextRecognizerPainter(
    this.recognizedText,
    this.imageSize,
    this.rotation,
    this.cameraLensDirection,
  );

  final RecognizedText recognizedText;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.0
          ..color = Colors.lightGreenAccent;

    final Paint background = Paint()..color = Color(0x99000000);

    for (int i = 0; i < recognizedText.blocks.length; i++) {
      final textBlock = recognizedText.blocks[i];
      final ParagraphBuilder builder = ParagraphBuilder(
        ParagraphStyle(
          textAlign: TextAlign.left,
          fontSize: 16,
          textDirection: TextDirection.ltr,
        ),
      );
      builder.pushStyle(
        ui.TextStyle(
          color:
              textBlock.text.toLowerCase().contains('estado')
                  ? Colors.red
                  : Colors.lightGreenAccent,
          background: background,
        ),
      );
      builder.addText('$i: ${textBlock.text}');
      builder.pop();

      final left = translateX(
        textBlock.boundingBox.left,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final top = translateY(
        textBlock.boundingBox.top,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final right = translateX(
        textBlock.boundingBox.right,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      // final bottom = translateY(
      //   textBlock.boundingBox.bottom,
      //   size,
      //   imageSize,
      //   rotation,
      //   cameraLensDirection,
      // );
      //
      // canvas.drawRect(
      //   Rect.fromLTRB(left, top, right, bottom),
      //   paint,
      // );

      final List<Offset> cornerPoints = <Offset>[];
      for (final point in textBlock.cornerPoints) {
        double x = translateX(
          point.x.toDouble(),
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        );
        double y = translateY(
          point.y.toDouble(),
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        );

        if (Platform.isAndroid) {
          switch (cameraLensDirection) {
            case CameraLensDirection.front:
              switch (rotation) {
                case InputImageRotation.rotation0deg:
                case InputImageRotation.rotation90deg:
                  break;
                case InputImageRotation.rotation180deg:
                  x = size.width - x;
                  y = size.height - y;
                  break;
                case InputImageRotation.rotation270deg:
                  x = translateX(
                    point.y.toDouble(),
                    size,
                    imageSize,
                    rotation,
                    cameraLensDirection,
                  );
                  y =
                      size.height -
                      translateY(
                        point.x.toDouble(),
                        size,
                        imageSize,
                        rotation,
                        cameraLensDirection,
                      );
                  break;
              }
              break;
            case CameraLensDirection.back:
              switch (rotation) {
                case InputImageRotation.rotation0deg:
                case InputImageRotation.rotation270deg:
                  break;
                case InputImageRotation.rotation180deg:
                  x = size.width - x;
                  y = size.height - y;
                  break;
                case InputImageRotation.rotation90deg:
                  x =
                      size.width -
                      translateX(
                        point.y.toDouble(),
                        size,
                        imageSize,
                        rotation,
                        cameraLensDirection,
                      );
                  y = translateY(
                    point.x.toDouble(),
                    size,
                    imageSize,
                    rotation,
                    cameraLensDirection,
                  );
                  break;
              }
              break;
            case CameraLensDirection.external:
              break;
          }
        }

        cornerPoints.add(Offset(x, y));
      }

      // Add the first point to close the polygon
      cornerPoints.add(cornerPoints.first);
      canvas.drawPoints(PointMode.polygon, cornerPoints, paint);

      canvas.drawParagraph(
        builder.build()
          ..layout(ParagraphConstraints(width: (right - left).abs())),
        Offset(
          Platform.isAndroid && cameraLensDirection == CameraLensDirection.front
              ? right
              : left,
          top,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(TextRecognizerPainter oldDelegate) {
    return oldDelegate.recognizedText != recognizedText;
  }
}

double translateX(
  double x,
  Size canvasSize,
  Size imageSize,
  InputImageRotation rotation,
  CameraLensDirection cameraLensDirection,
) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
      return x *
          canvasSize.width /
          (Platform.isIOS ? imageSize.width : imageSize.height);
    case InputImageRotation.rotation270deg:
      return canvasSize.width -
          x *
              canvasSize.width /
              (Platform.isIOS ? imageSize.width : imageSize.height);
    case InputImageRotation.rotation0deg:
    case InputImageRotation.rotation180deg:
      switch (cameraLensDirection) {
        case CameraLensDirection.back:
          return x * canvasSize.width / imageSize.width;
        default:
          return canvasSize.width - x * canvasSize.width / imageSize.width;
      }
  }
}

double translateY(
  double y,
  Size canvasSize,
  Size imageSize,
  InputImageRotation rotation,
  CameraLensDirection cameraLensDirection,
) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
    case InputImageRotation.rotation270deg:
      return y *
          canvasSize.height /
          (Platform.isIOS ? imageSize.height : imageSize.width);
    case InputImageRotation.rotation0deg:
    case InputImageRotation.rotation180deg:
      return y * canvasSize.height / imageSize.height;
  }
}
