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
        // ------- Arredondamento da barra superior
        // Container(
        //     height: size.height * 0.02,
        //     child: Stack(
        //       children: <Widget>[
        //         Container(
        //           height: size.height * 0.02,
        //           decoration: BoxDecoration(
        //               color: darkGreen,
        //               borderRadius: BorderRadius.only(
        //                 bottomLeft: Radius.circular(40),
        //                 bottomRight: Radius.circular(40),
        //               )),
        //         )
        //       ],
        //     )),
      ],
    );
  }
}
