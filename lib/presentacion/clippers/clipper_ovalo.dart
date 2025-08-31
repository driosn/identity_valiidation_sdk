import 'package:flutter/material.dart';

class ClipperOvalo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final width = size.width * 0.9;
    final height = size.height * 0.6;

    return Path()..addOval(
      Rect.fromCenter(
        center: Offset(centerX, centerY),
        width: width,
        height: height,
      ),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
