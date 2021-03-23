import 'package:med_app/screens/home/components/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        // ------- Arredondamento da barra superior (visível nas outras páginas)
        Container(
            height: size.height * 0.02,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.02,
                  decoration: BoxDecoration(
                      color: darkBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )),
                )
              ],
            )),
        // ------------------------------------------------------------- Relogio
        Container(
            child: Stack(children: <Widget>[
          ClockCircle(),
          Align(alignment: Alignment.center, child: DigitalClockWidget()),
          Align(alignment: Alignment.center, child: DateWidget()),
        ]))
      ],
    );
  }
}
