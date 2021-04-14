import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class AlarmInfo {
  DateTime alarmDateTime; //-------Horário para ser disparado
  String description; //------Quantidade da medicação
  String name; //-------Nome do medicamento
  List<int> days;
  bool isActive; //booleano para ativar ou esativar, ainda não implementado
  Color color;

  AlarmInfo({this.alarmDateTime,
            this.name,
            this.description,
            this.color,
            this.days,
            this.isActive
            }); //-----Construtor

factory AlarmInfo.fromJson(Map<String, dynamic> json) => AlarmInfo(
        alarmDateTime: DateTime.parse(json["DateTime"]),
        description: json["description"],
        name: json["name"],
        days: List<int>.from(json["days"].map((x) => x)),
        isActive: json["isActive"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "DateTime": alarmDateTime.toIso8601String(),
        "description": description,
        "name": name,
        "days": List<dynamic>.from(days.map((x) => x)),
        "isActive": isActive,
        "color": color,
    };

  void setActive(bool b) {
    this.isActive = b;
  }
}

List<AlarmInfo> alarms = [
  //---------Lista de casos teste, mas futuramente serão armazenados dados cadastrados
  AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 4, minutes: 42)),
    name: "Domperidona",
    description: "1 comprimido",
    days: new List.from([4, 6]),
    isActive: true,
    color: testes1
  ),
  AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 4, minutes: 42)),
    name: "Nimesulida",
    description: "20 ml",
    days: new List.from([4, 5, 6]),
    isActive: true,
    color: testes2
  ),
   AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 4, minutes: 42)),
    name: "Amoxicilina",
    description: "2 comprimidos",
    days: new List.from([1, 2, 3, 4, 5, 6, 7]),
    isActive: true,
    color: testes3
  ),
  /*AlarmInfo(DateTime.now().add(Duration(hours: 4, minutes: 42)), 'Nimesulida',
      '20ml', testes2, new List.from([2, 4, 6]), true),
  AlarmInfo(DateTime.now().add(Duration(hours: 8, minutes: 42)), 'Amoxilina',
      '2 comprimidos', testes6, new List.from([1, 2, 3, 4, 5, 6, 7]), true),
  AlarmInfo(DateTime.now().add(Duration(hours: 0, minutes: 42)), 'Domperidona',
      '1 comprimido', testes3, new List.from([4, 6]), true),
  AlarmInfo(DateTime.now().add(Duration(hours: 4, minutes: 42)), 'Nimesulida',
      '20ml', testes5, new List.from([2, 4, 6]), true),
  AlarmInfo(DateTime.now().add(Duration(hours: 8, minutes: 42)), 'Amoxilina',
      '2 comprimidos', testes4, new List.from([1, 2, 3, 4, 5, 6, 7]), true),
      */
];
