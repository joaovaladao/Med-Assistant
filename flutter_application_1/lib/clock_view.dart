import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var paint_circle1 = Paint()..color = Color(0xFF00BFA5);

    var paint_circle2 = Paint()
      ..color = Color(0xFFFFF3E0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var paint_circle3 = Paint()..color = Color(0xFF212121);

    var minPont = Paint()
      ..color = Colors.pink[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var horPont = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius - 50, paint_circle1); //Círculo interno
    canvas.drawCircle(center, radius - 50, paint_circle2); //Círculo externo

    canvas.drawLine(center, Offset(100, 100), minPont); //Ponteiro minutos
    canvas.drawLine(center, Offset(150, 100), horPont); //Ponteiro horas

    canvas.drawCircle(center, radius - 140,
        paint_circle3); //Círculo do centro, deve ficar por último
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
