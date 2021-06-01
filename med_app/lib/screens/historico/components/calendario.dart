import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants.dart';
import '../../../dataInit.dart';

// ignore: must_be_immutable
class Calendar extends StatefulWidget  {
  final DataInit dataInit;
  final Map<DateTime, List> events;
  final CalendarController controller;
  List selectedEvents;
  final TextEditingController descriptionController;

  Calendar({
   this.dataInit,
   this.events,
   this.controller,
   this.selectedEvents,
   this.descriptionController,
  });

    @override
  _CalendarState createState() => _CalendarState();
}
class _CalendarState extends State<Calendar> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: widget.dataInit.getAlarms(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Calendário",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  gradient: LinearGradient(colors: GradientColors.calendar),
                ),
                //----------------------------------------------Função que retorna calendário
                child: TableCalendar(
                  events: widget.events,
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    canEventMarkersOverflow: true,
                    todayColor: Colors.orange,
                    selectedColor: Colors.blue,
                    weekdayStyle: TextStyle(fontSize: 20, color: Colors.white),
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                    weekendStyle: TextStyle(fontSize: 20, color: Colors.white),
                    outsideWeekendStyle: TextStyle(color: Colors.white),
                    outsideDaysVisible: true,
                    outsideStyle: TextStyle(fontSize: 20,color: Colors.white60),
                    renderDaysOfWeek: true,
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
                    titleTextStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onDaySelected: _onDaySelected,
                  
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  calendarController: widget.controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Eventos",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white),),
              ),
              ...widget.selectedEvents.map((event) => ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal:16, vertical: 0),
                    title: Text(
                      event,
                      //widget.alarmes[0].name ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      widget.descriptionController.text,
                      //widget.alarmes[0].description ?? "",
                      style: TextStyle(color: Colors.white60, fontSize: 15),
                    ),
                  )),
            ],
          );
          }
          else{
            return Center(
              child:Text("Loading...", style: TextStyle(color: Colors.white, fontSize: 20),)
           );
          }
        },
      ),
    );
  }
    void _onDaySelected(DateTime day, List events, List holidays){
    print('CALLBACK: _onDaySelected');
      setState(() {
        widget.selectedEvents = events;
      });
  }
}