import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class AlarmInfo{
  DateTime alarmDateTime; //-------Horário para ser disparado
  String description; //------Quantidade da medicação
  String name;  //-------Nome do medicamento
  List<Color> gradientColors; //-------Cores para a box
  bool isActive;  //booleano para ativar ou esativar, ainda não implementado

  AlarmInfo(this.alarmDateTime, this.name ,this.description, this.gradientColors); //-----Construtor
}

List<AlarmInfo> alarms = [  //---------Lista de casos teste, mas futuramente serão armazenados dados cadastrados
  AlarmInfo(DateTime.now().add(Duration(hours: 0, minutes: 42)),'Domperidona','1 comprimido', GradientColors.sea),
  AlarmInfo(DateTime.now().add(Duration(hours: 4, minutes: 42)),'Nimesulina', '20ml', GradientColors.mango),
  AlarmInfo(DateTime.now().add(Duration(hours: 8, minutes: 42)),'Amoxicilina', '2 comprimidos', GradientColors.sky),
];