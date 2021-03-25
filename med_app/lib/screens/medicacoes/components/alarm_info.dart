import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class AlarmInfo{
  DateTime alarmDateTime;
  String description;
  List<Color> gradientColors;
  bool isActive;

  AlarmInfo(this.alarmDateTime, this.description, this.gradientColors);
}

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),'1 comprimido', GradientColors.sea),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)), '50ml', GradientColors.mango),
  AlarmInfo(DateTime.now().add(Duration(hours: 3)), '2 comprimidos', GradientColors.sky),
];