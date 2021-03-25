class AlarmInfo{
  DateTime alarmDateTime;
  String description;
  bool isActive;

  AlarmInfo(this.alarmDateTime, this.description);
}

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'comprimido'),
];