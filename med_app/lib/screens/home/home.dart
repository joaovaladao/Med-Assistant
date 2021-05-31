import 'package:med_app/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: buildAppBar(), preferredSize: Size.fromHeight(65.0)),
        body: Body());
  }
}

AppBar buildAppBar() {
  // Constroi a barra superior do app
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)),
    ),
    title: Text('Med Assistant'),
    centerTitle: true,
    backgroundColor: darkBackground,
    elevation: 0,
  );
}
