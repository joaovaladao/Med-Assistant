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
  AlarmInfo(DateTime.now().add(Duration(hours: 0, minutes: 42)),'Domperidona','1 comprimido', GradientColors.sea),
  AlarmInfo(DateTime.now().add(Duration(hours: 4, minutes: 42)),'Nimesulina', '20ml', GradientColors.mango),
  AlarmInfo(DateTime.now().add(Duration(hours: 8, minutes: 42)),'Amoxicilina', '2 comprimidos', GradientColors.sky),
];