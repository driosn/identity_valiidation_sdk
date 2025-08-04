import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image/image.dart' as img;

class DocumentFrontScreen extends StatefulWidget {
  const DocumentFrontScreen({super.key});

  @override
  State<DocumentFrontScreen> createState() => _DocumentFrontScreenState();
}

class _DocumentFrontScreenState extends State<DocumentFrontScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isCapturing = false;
  XFile? _capturedImage;

  // ML Kit object detection
  final ObjectDetector _objectDetector = ObjectDetector(
    options: ObjectDetectorOptions(
      mode: DetectionMode.stream,
      classifyObjects: true,
      multipleObjects: true,
    ),
  );

  bool _isDetecting = false;
  bool _documentDetected = false;
  Timer? _detectionTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    _objectDetector.close();
    _detectionTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _controller = CameraController(
          _cameras![0], // Use the first camera (usually back camera)
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _controller!.initialize();

        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
          // Start automatic detection
          _startDocumentDetection();
        }
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  void _startDocumentDetection() {
    _detectionTimer?.cancel();
    _detectionTimer = Timer.periodic(const Duration(milliseconds: 1000), (
      timer,
    ) {
      if (!_isDetecting && !_isCapturing && mounted) {
        _detectDocument();
      }
    });
  }

  Future<void> _detectDocument() async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _isDetecting) {
      return;
    }

    try {
      setState(() {
        _isDetecting = true;
      });

      // Take a picture for detection
      final XFile image = await _controller!.takePicture();
      final File imageFile = File(image.path);

      // Convert to InputImage
      final InputImage inputImage = InputImage.fromFile(imageFile);

      // Detect objects
      final List<DetectedObject> objects = await _objectDetector.processImage(
        inputImage,
      );

      // Check if any object is detected in the frame
      bool documentFound = false;
      debugPrint('Detected ${objects.length} objects');
      for (final DetectedObject object in objects) {
        // Check if the object is within the frame bounds
        if (_isObjectInFrame(object, imageFile)) {
          documentFound = true;
          debugPrint(
            'Object detected in frame - Bounding box: ${object.boundingBox}',
          );
          break;
        }
      }

      if (documentFound && !_documentDetected) {
        setState(() {
          _documentDetected = true;
        });

        // Auto-capture after a short delay
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted && _documentDetected) {
          await _takePicture();
        }
      } else if (!documentFound && _documentDetected) {
        setState(() {
          _documentDetected = false;
        });
      }

      // Clean up the temporary image
      await imageFile.delete();
    } catch (e) {
      debugPrint('Error detecting document: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isDetecting = false;
        });
      }
    }
  }

  bool _isObjectInFrame(DetectedObject object, File imageFile) {
    try {
      // Get image dimensions
      final img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
      if (image == null) return false;

      final double imageWidth = image.width.toDouble();
      final double imageHeight = image.height.toDouble();

      // Define frame bounds (center 280x180 area)
      final double frameWidth = 280;
      final double frameHeight = 180;
      final double frameLeft = (imageWidth - frameWidth) / 2;
      final double frameTop = (imageHeight - frameHeight) / 2;
      final double frameRight = frameLeft + frameWidth;
      final double frameBottom = frameTop + frameHeight;

      // Check if object bounding box is mostly within the frame
      final Rect boundingBox = object.boundingBox;
      final double objectLeft = boundingBox.left;
      final double objectTop = boundingBox.top;
      final double objectRight = boundingBox.right;
      final double objectBottom = boundingBox.bottom;

      // Calculate overlap
      final double overlapLeft =
          objectLeft > frameLeft ? objectLeft : frameLeft;
      final double overlapTop = objectTop > frameTop ? objectTop : frameTop;
      final double overlapRight =
          objectRight < frameRight ? objectRight : frameRight;
      final double overlapBottom =
          objectBottom < frameBottom ? objectBottom : frameBottom;

      if (overlapRight <= overlapLeft || overlapBottom <= overlapTop) {
        return false; // No overlap
      }

      final double overlapArea =
          (overlapRight - overlapLeft) * (overlapBottom - overlapTop);
      final double objectArea =
          (objectRight - objectLeft) * (objectBottom - objectTop);

      // Object is considered in frame if at least 40% of it is within the frame
      // This makes it more sensitive to document detection
      return overlapArea / objectArea > 0.4;
    } catch (e) {
      debugPrint('Error checking object in frame: $e');
      return false;
    }
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      setState(() {
        _isCapturing = true;
      });

      final XFile image = await _controller!.takePicture();

      setState(() {
        _capturedImage = image;
        _isCapturing = false;
        _documentDetected = false; // Reset detection
      });

      // Show the captured image
      if (mounted) {
        _showCapturedImage(image);
      }
    } catch (e) {
      setState(() {
        _isCapturing = false;
      });
      debugPrint('Error taking picture: $e');
    }
  }

  void _showCapturedImage(XFile image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Captured Image'),
          content: SizedBox(
            child: Image.file(File(image.path), fit: BoxFit.contain),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _capturedImage = null;
                });
              },
              child: const Text('Retake'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Here you can add logic to use the captured image
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Image captured successfully!')),
                );
              },
              child: const Text('Use Image'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized || _controller == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Scanner'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Camera preview
          CameraPreview(_controller!),

          // Overlay with scanning guide
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
              ),
              child: Center(
                child: Container(
                  width: 280,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _documentDetected ? Colors.green : Colors.white,
                      width: _documentDetected ? 4 : 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _documentDetected
                              ? Icons.check_circle
                              : Icons.document_scanner,
                          color:
                              _documentDetected ? Colors.green : Colors.white,
                          size: 32,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _documentDetected
                              ? 'Object detected!'
                              : 'Position document here',
                          style: TextStyle(
                            color:
                                _documentDetected ? Colors.green : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_documentDetected)
                          const Text(
                            'Capturing in 0.5s...',
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Capture button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _isCapturing ? null : _takePicture,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isCapturing ? Colors.grey : Colors.white,
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child:
                      _isCapturing
                          ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                          : const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.black,
                          ),
                ),
              ),
            ),
          ),

          // Instructions
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _documentDetected
                        ? 'Object detected! Photo will be taken automatically.'
                        : 'Place your document within the frame and ensure it\'s well lit',
                    style: TextStyle(
                      color: _documentDetected ? Colors.green : Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (_isDetecting)
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Analyzing...',
                        style: TextStyle(color: Colors.yellow, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
