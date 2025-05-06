import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final bool isDotted;
  final Color color;
  final double? widthDash;

  DashedBorderPainter( {this.isDotted = false, required this.color,this.widthDash, });

  @override
  void paint(Canvas canvas, Size size,) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final radius = 5.0; // Border radius
    final dashWidth = isDotted ? widthDash ?? 1.0 : 5.0; // Dot or dash length
    final dashSpace = 3.0; // Space between dashes/dots

    // Draw rounded rectangle with dashes/dots
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ));

    final dashPath = Path();
    var distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}