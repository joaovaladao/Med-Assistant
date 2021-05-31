import 'package:med_app/screens/home/components/clock_view.dart';
import 'package:flutter/material.dart';
//import 'package:med_app/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // ------------------------------------------------------------- Relogio
        Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Stack(children: <Widget>[
              ClockCircle(),
              Align(alignment: Alignment.center, child: DigitalClockWidget()),
              Align(alignment: Alignment.center, child: DateWidget()),
            ]))
      ],
    );
  }
}
