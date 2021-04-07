import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
//import 'alarm_info.dart';

class Horario extends StatefulWidget {
  @override
  _HorarioState createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {
  static const values = <String>['Segunda-Feira','Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sábado','Domingo'];
  String selectedValue = values.first;

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
                      colors: GradientColors.semcor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
            child: Column(
              children: <Widget>[
                Text(
                 "Definir os dias",
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
                 fontSize: 20,
                  ),
                textAlign: TextAlign.left,
                ),
                buildRadius(),
              ],
            ),
          ),
          ],
      ),
    );
  }

 Widget buildRadius() => Column(
   children: values.map(
     (value){
       return RadioListTile<String>(
                  value: value,
                  groupValue: selectedValue,
                  title: Text(value),
                  onChanged: (value) => setState(()=> this.selectedValue = value),
                  );
     },
   ).toList(),
  );
}