import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
//import 'alarm_info.dart';

class Horario extends StatefulWidget {
  @override
  _HorarioState createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página para cadastrar os horários'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: <Widget>[
          Container(
             margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.valads,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
            child: Column(
              children: <Widget>[
                Text(
                 "Definir Horário",
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
                 fontSize: 20,
                  ),
                textAlign: TextAlign.left,
                ),

                RadioListTile<int>(
                  value: 1,
                  groupValue: selectedValue,
                  title: Text(
                  "Segunda",
                   style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
                   ),
                   onChanged: (value) => setState(() => selectedValue = 1),
                  )
              ],
            ),
          ),
          ],
      ),
    );
  }
}