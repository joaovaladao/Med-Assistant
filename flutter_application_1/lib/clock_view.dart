import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override void initState(){
    Timer.periodic(Duration(seconds: 1), (timer){
      setState((){

      });
    });// Timer.periodic

    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        )
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  //60sec - 360, 1sec- 6degree
  //12hour - 360, 1hour- 30degrees, 1min - 0.5degrees

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

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minHandX, minHandY), minPont); //Ponteiro minutos
    
    var hourHandX = centerX + 60 * cos(dateTime.hour * 30 * dateTime.minute * 0.5 * pi / 180);
    var hourHandY = centerX + 60 * sin(dateTime.hour * 30 * dateTime.minute * 0.5 * pi / 180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), horPont); //Ponteiro horas

    canvas.drawCircle(center, radius - 140,
        paint_circle3); //Círculo do centro, deve ficar por último
        
        /*
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for(double i=0; i<360; i+=12){
      var x1 = centerX + innerCircleRadius * cos(i * pi /180);
      var y1 = centerX + outerCircleRadius * sin(i * pi /180);

      
      var x2 = centerX + innerCircleRadius * cos(i * pi /180);
      var y2 = centerX + outerCircleRadius * sin(i * pi /180);
      canvas.drawLine(Offset(x1,y1), Offset(x2,y2), dashBrush);
    }*/

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
