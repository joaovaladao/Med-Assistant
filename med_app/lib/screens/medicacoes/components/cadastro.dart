import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:med_app/constants.dart';
//import 'alarm_info.dart';


class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}