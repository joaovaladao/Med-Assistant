import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/home/components/clock_circle.dart';

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
        // Arredondamento da barra de navegacao superior(só vai ser visível nas outras páginas)
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
        // ----------------------------------------------------------- Relogio
        Container(child: Column(children: <Widget>[ClockCircle()]))
      ],
    );
  }
}
