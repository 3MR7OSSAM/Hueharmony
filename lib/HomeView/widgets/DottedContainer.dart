import 'package:flutter/material.dart';

class DottedContainer extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final Color color;
  final double gap;

  const DottedContainer({
    Key? key,
    required this.child,
    this.strokeWidth = 1.0,
    this.color = Colors.black,
    this.gap = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: DottedPainter(
          strokeWidth: strokeWidth,
          color: color,
          gap: gap,
        ),
        child: child,
      ),
    );
  }
}

class DottedPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DottedPainter({
    required this.strokeWidth,
    required this.color,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = 0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + gap, 0), paint);
      x += gap * 2;
    }

    double y = 0;
    while (y < size.height) {
      canvas.drawLine(Offset(0, y), Offset(0, y + gap), paint);
      y += gap * 2;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

