import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context){
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
  }

  class ClockPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      var centerX = size.width/2;
      var centerY = size.height/2;
      var center = Offset(centerX, centerY);
      var radius = min(centerX, centerY);
      var paint_circle = Paint()
      ..color = Color(0xFF00BFA5);

      canvas.drawCircle(center, radius-50, paint_circle);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }

  }