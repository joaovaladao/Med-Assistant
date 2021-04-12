import 'package:flutter/material.dart';
//import 'package:med_app/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CalendarController calendarController;

  void initState(){
    super.initState();
    calendarController = CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(calendarController: calendarController),
        ],
      )
    );
  }
}
