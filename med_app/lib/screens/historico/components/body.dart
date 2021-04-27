import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:med_app/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CalendarController calendarController;

  void initState() {
    super.initState();
    calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
//----------------------------------------------Arquitetura
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),

        Text(
          "Calendário",
          style: TextStyle(
              fontFamily: 'OpenSans', color: Colors.white, fontSize: 28),
        ),

        Container(
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(colors: GradientColors.semcor),
          ),
          //----------------------------------------------Função que retorna calendário
          child: TableCalendar(
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
                leftChevronIcon: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.white,
                ),
                rightChevronIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              calendarController: calendarController),
        ),
//--------------------------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.serrinha),
              ),
              child: Text(
                "BEM =)",
                style: TextStyle(
                    fontFamily: 'OpenSans', color: Colors.white, fontSize: 25),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.fire),
              ),
              child: Text(
                "MAL =(",
                style: TextStyle(
                    fontFamily: 'OpenSans', color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
