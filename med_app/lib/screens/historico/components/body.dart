import 'dart:convert';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/alarm_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


// ignore: must_be_immutable
class Body extends StatefulWidget {
  final List<AlarmInfo> alarmes = List<AlarmInfo>();
  final AlarmInfo alarmInfo;

  Body({this.alarmInfo});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _dataInit = DataInit();
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;
  final _nomeController = TextEditingController();
  final _descriptionController = TextEditingController();
  AlarmInfo editaAlarm;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    initPrefs();
    if(widget.alarmInfo == null){
      print("null foi recebido");
      editaAlarm = AlarmInfo(id: 0, name: "Amoxicilina", description: "1 pílula");
    }
    else{
      editaAlarm = AlarmInfo.fromMap(widget.alarmInfo.toMap());
    }
      _nomeController.text = editaAlarm.name;
      _descriptionController.text = editaAlarm.description;
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.alarmes[0].name);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _dataInit.getAlarms(),
          // ignore: missing_return
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
                    events: _events,
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
                          //borderRadius: BorderRadius.circular(10.0)
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
                    calendarController: _controller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Eventos",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white),),
                ),
                ..._selectedEvents.map((event) => ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal:16, vertical: 0),
                      title: Text(
                        _nomeController.text,
                        //widget.alarmes[0].name ?? "",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Text(
                        _descriptionController.text,
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

  void _onDaySelected(DateTime day, List events, List holidays){
    print('CALLBACK: _onDaySelected');
      setState(() {
        _selectedEvents = events;
      });
  }
  
  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]
                          .add(_eventController.text);
                    } else {
                      _events[_controller.selectedDay] = [
                       _eventController.text
                      ];
                    }
                    prefs.setString("events", json.encode(encodeMap(_events)));
                    _eventController.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
    setState(() {
      _selectedEvents = _events[_controller.selectedDay];
    });
  }
  Future<String> getFutureDados() async =>
      await Future.delayed(Duration(seconds: 10), () {
        return 'Dados recebidos...';
      });
}
