import 'package:flutter/material.dart';
import 'package:monisha_portfolio/utils/constants.dart';

class CurvedLinePainter extends CustomPainter {
  final int itemCount;
  final double progress;

  CurvedLinePainter({
    required this.itemCount,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Apptheme.deepPurple.withOpacity(0.3);
    // ..color = Apptheme.darkBlue.withOpacity(0.3);

    final activePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Apptheme.deepPurple;
    // ..color = Apptheme.darkBlue;

    final segmentHeight = size.height / (itemCount - 1);
    final path = Path();
    path.moveTo(10, 0);

    for (int i = 0; i < itemCount - 1; i++) {
      final startY = i * segmentHeight;
      final endY = (i + 1) * segmentHeight;
      final midY = (startY + endY) / 2;

      path.cubicTo(
        10,
        startY + segmentHeight * 0.25,
        30,
        midY - segmentHeight * 0.25,
        30,
        midY,
      );
      path.cubicTo(
        30,
        midY + segmentHeight * 0.25,
        10,
        endY - segmentHeight * 0.25,
        10,
        endY,
      );
    }

    // Draw inactive line
    canvas.drawPath(path, paint);

    // Draw active line
    if (progress > 0) {
      final activeLinePath = path.computeMetrics().first;
      final activePath = activeLinePath.extractPath(
        0,
        activeLinePath.length * progress,
      );
      canvas.drawPath(activePath, activePaint);
    }
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.itemCount != itemCount;
  }
}
