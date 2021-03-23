import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class ClockCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      width: 500,
      height: 250,
      //color: lightBackground, // Ativar para visualizar o tamanho do container
      child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: CirclePainter(),
          )),
    );
  }
}

class CirclePainter extends CustomPainter {
  // Desenha o circulo
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var outlineBrush = Paint()
      ..color = lightGreen
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    canvas.drawCircle(center, radius, outlineBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
