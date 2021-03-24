import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/home/components/menu_bar.dart';

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
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home:
          MenuBar(), // Chama a classe Menu para decidir qual página será acessada.
      //bottonNavigationBar: MyStatefulWidget(),
    );
  }
}
