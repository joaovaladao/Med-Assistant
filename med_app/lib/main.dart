import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Assistant',
      theme: ThemeData(
        scaffoldBackgroundColor: darkBackground,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(), // Chama a pagina home
    );
  }
}
