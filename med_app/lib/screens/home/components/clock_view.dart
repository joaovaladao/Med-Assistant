import 'dart:math';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:intl/intl.dart';

// ---------------------------- Circulo do relogio -----------------------------

class ClockCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      width: 500,
      height: 235,
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
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var outlineBrush = Paint()
      ..color = neutralGreen
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

// ------------------------------ Relogio Digital ------------------------------

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DigitalClockWidgetState();
  }
}

class DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  Timer timer;

  @override
  void initState() {
    this.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var perviousMinute = DateTime.now().add(Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute)
        setState(() {
          formattedTime = DateFormat('HH:mm').format(DateTime.now());
        });
    });
    super.initState();
  }

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 62.0),
        child: Text(
          formattedTime,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 62),
        ));
  }
}

// ----------------------------------- Data ------------------------------------

class DateWidget extends StatefulWidget {
  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 140.0),
      child: Text(
        formattedDate,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20),
      ),
    );
  }
}
