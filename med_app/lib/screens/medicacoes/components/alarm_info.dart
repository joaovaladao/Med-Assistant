class AlarmInfo{
  DateTime alarmDateTime;
  String description;
  bool isActive;

  AlarmInfo(this.alarmDateTime, this.description);
}

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), '1 comprimido'),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)), '50ml'),
  AlarmInfo(DateTime.now().add(Duration(hours: 3)), '2 comprimido'),
];