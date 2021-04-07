import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:med_app/constants.dart';
//import 'alarm_info.dart';

class Horario extends StatefulWidget {
  @override
  _HorarioState createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página para cadastrar os horários'),
      ),
    );
  }
}