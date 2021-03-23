import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/home/components/body.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Body()); // Corpo do app definido no body.dart
  }
}

AppBar buildAppBar() {
  // Constroi a barra superior do app
  return AppBar(
    title: Text('MED assistant'),
    backgroundColor: darkBackground,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () => {},
    ),
  );
}
