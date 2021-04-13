import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/navBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Assistant',
      theme: ThemeData(
        unselectedWidgetColor: Colors.white60,
        scaffoldBackgroundColor: darkBackground,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}
