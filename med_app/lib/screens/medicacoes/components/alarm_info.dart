import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class AlarmInfo{
  DateTime alarmDateTime;
  String description;
  String name;
  List<Color> gradientColors;
  bool isActive;

  AlarmInfo(this.alarmDateTime, this.name ,this.description, this.gradientColors);
}

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),'Domperidona','1 comprimido', GradientColors.sea),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),'Nimesulina', '20ml', GradientColors.mango),
  AlarmInfo(DateTime.now().add(Duration(hours: 3)),'Amoxicilina', '2 comprimidos', GradientColors.sky),
];