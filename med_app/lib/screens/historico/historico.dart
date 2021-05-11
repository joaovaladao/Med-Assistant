// Dedicado à pagina do historico

import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/historico/components/body.dart';
import 'package:med_app/screens/medicacoes/components/alarm_info.dart';

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  DataInit db = DataInit();
  List<AlarmInfo> alarmes = List<AlarmInfo>();

  @override
  void initState(){
    super.initState();

    db.getAlarms().then((lista) {
      alarmes = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: buildAppBar(), preferredSize: Size.fromHeight(65.0)),
        body: Body(/*alarmInfo: alarmes[0],*/));
  }
}

AppBar buildAppBar() {
  // Constroi a barra superior do app
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)),
    ),
    title: Text('Med Assistant'),
    centerTitle: true,
    backgroundColor: neutralBlue,
    elevation: 0,
  );
}
