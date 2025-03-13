import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CirclePickerPainter extends CustomPainter {
  const CirclePickerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width, size.height) / 2;

    // グラデーションの円
    const sweepGradient = SweepGradient(
      colors: [
        Color.fromARGB(255, 255, 0, 0),
        Color.fromARGB(255, 255, 255, 0),
        Color.fromARGB(255, 0, 255, 0),
        Color.fromARGB(255, 0, 255, 255),
        Color.fromARGB(255, 0, 0, 255),
        Color.fromARGB(255, 255, 0, 255),
      ],
    );

    final sweepShader = sweepGradient.createShader(
      Rect.fromLTWH(0, 0, radius * 2, radius * 2),
    );

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.fill
        ..shader = sweepShader,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
