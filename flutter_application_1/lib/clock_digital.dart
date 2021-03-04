import 'package:flutter/material.dart';
import 'package:flutter_application_1/clock_view.dart';

class DigitalClock extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DigitalClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Clock',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              'Clock',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              'Clock',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            ClockView(),
          ],
        ),
      ),
    );
  }
}
