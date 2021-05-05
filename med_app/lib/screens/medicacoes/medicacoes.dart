// Dedicado à pagina de medicacoes
import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/alarm_info.dart';
import 'package:med_app/screens/medicacoes/components/body.dart';
import 'package:med_app/screens/medicacoes/components/notification.dart';
import 'components/cadastro.dart';

class Medicacoes extends StatefulWidget {
  @override
  _MedicacoesState createState() => _MedicacoesState();
}

class _MedicacoesState extends State<Medicacoes> {
  Future<List<AlarmInfo>> _alarms;
  DataInit _dataInit1 = DataInit();    //------Variável do banco de dados
  //DateTime _alarmTime;

  @override


  //---------------------Função para inicializar o banco de dados
  void initState(){
    //_alarmTime = DateTime.now();
    notificationPlugin.setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
    _dataInit1.initializeDatabase().then((value) {
      print("--------------Banco de Dados foi Iniciado--------------");
      loadAlarms();
    });
    super.initState();
  }
  //------------------------------------------------

  //---------------------Função para atualizar a lista de alarmes
  void loadAlarms(){
    _alarms = _dataInit1.getAlarms();
    if(mounted) setState(() {});
  }
  //------------------------------------------------
  //
    Future<List<AlarmInfo>> getLista(){
    return _alarms;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: buildAppBar(), preferredSize: Size.fromHeight(65.0)),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cadastro()));
        },
        splashColor: lightGreen,
        backgroundColor: neutralGreen,
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
  onNotificationInLowerVersions(ReceivedNotification receivedNotification){}
  onNotificationClick(String payload){}
}

AppBar buildAppBar() {
  //-------------------------------------Constroi a barra superior do app
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)),
    ),
    title: Text('Med Assistant'),
    centerTitle: true,
    backgroundColor: darkGreen,
    elevation: 0,
  );
}

