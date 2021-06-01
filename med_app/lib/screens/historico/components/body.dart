import 'dart:convert';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/alarm_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendario.dart';


// ignore: must_be_immutable
class Body extends StatefulWidget {
  final String nameAlarm;
  final String descripAlarm;

  Body({this.nameAlarm, this.descripAlarm});

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
    if(widget.nameAlarm == null){
      print("null foi recebido");
      editaAlarm = AlarmInfo(id: 0, name: "Amoxicilina", description: "1 pílula");
    }
    else{
      print("alarme foi recebido");
      editaAlarm = AlarmInfo(id: 0, name: widget.nameAlarm, description: widget.descripAlarm);
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
    return Scaffold(
      body: Calendar(dataInit: _dataInit, events: _events, controller: _controller, selectedEvents: _selectedEvents, descriptionController: _descriptionController),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }
  
  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              //content: TextField(
                //controller: _eventController,
              //),
              actions: <Widget>[
                FlatButton(
                  child: Center(child: Text("Save")),
                  onPressed: () {
                    //if (_eventController.text.isEmpty) return;
                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]
                          .add(_nomeController.text);
                    } else {
                      _events[_controller.selectedDay] = [
                       _nomeController.text
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
}

