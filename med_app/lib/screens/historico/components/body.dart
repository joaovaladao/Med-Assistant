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
          TableCalendar(
            calendarStyle: CalendarStyle(
              markersColor: Colors.white,
              weekdayStyle: TextStyle(color: Colors.white),
              todayColor: Colors.orange,
              selectedColor: Theme.of(context).primaryColor,
              todayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
              weekendStyle: TextStyle(color: Colors.white),
              outsideWeekendStyle: TextStyle(color: Colors.white),
              renderDaysOfWeek: false,
            ),
            headerStyle: HeaderStyle(
              leftChevronIcon: Icon(Icons.arrow_back_ios, size: 15, color: Colors.white,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white,),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
              formatButtonDecoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            calendarController: calendarController
            ),
        ],
      )
    );
  }
}
