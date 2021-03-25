import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'alarm_info.dart';

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
        Expanded(
          child: ListView(
            children: alarms.map((alarm) {
              return Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.purple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              );
            }).toList(),
          )
        )
      ],
    );
  }
}
