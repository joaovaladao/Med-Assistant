import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/horario.dart';
import 'package:med_app/screens/medicacoes/components/notification.dart';
import 'alarm_info.dart';
import 'package:med_app/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';

// ignore: must_be_immutable
class Cadastro extends StatelessWidget {
  int i = 0;
  List namaste;
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getDias();
  final _form = GlobalKey<FormState>();
  var _dataInit = DataInit();
  final Map<String, String> _formData =
      {}; 
  Cadastro({this.namaste});
 //--------------------------------------Variável que armazena todos os dados do cadastro

  Future showNotification(int hash, DateTime dateTime, String nome, String description, {String sound}) async{  //Função que aciona Notificação ao dispositivo
    var androidDetails = new AndroidNotificationDetails("channelId", "channelName", "channelDescription",
     sound: RawResourceAndroidNotificationSound('drama_total'),
     priority: Priority.High,
     importance: Importance.Max,
     );
    var iosDetails = new IOSNotificationDetails(sound: 'android_music.wav');
    var generalNotification = new NotificationDetails(androidDetails, iosDetails);
    /*await flutterLocalNotificationsPlugin.schedule(
      hash,
      nome,
      description,
      dateTime,
      generalNotification,
      payload: hash.toString(),
      );*/
      var time = new Time(dateTime.hour,dateTime.minute,dateTime.second);
      await flutterLocalNotificationsPlugin.showDailyAtTime(
        hash,
        nome,
        description,
        time,
        generalNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Medicamento'),
        backgroundColor: darkGreen,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close)),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                decoration: BoxDecoration(
                  color: lighterBackground,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: TextFormField(
 //---------------------------------------------------Funções para inserir os dados
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Nome",
                      labelStyle: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) =>
                      _formData['medicamento'] = value, 
 //-----------------------------------------------------Salva o nome
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                decoration: BoxDecoration(
                  color: lighterBackground,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: TextFormField(
 //-----------------------------------------------------Funções para inserir os dados
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Quantidade",
                      labelStyle: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) =>
                      _formData['quantidade'] = value, 
 //-----------------------------------------------------Salva a quantidade
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                decoration: BoxDecoration(
                  color: lighterBackground,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: TextFormField(
 //-----------------------------------------------------Funções para inserir os dados
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Duração",
                      labelStyle: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) =>
                      _formData['duração'] = value, 
 //-----------------------------------------------------Salva o nome
                ),
              ),
              Container(
 //-----------------------------------------------------Cria botão de cancelar
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Remover dados",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
 //-----------------------------------------------------Cria botão de agendar o horário
                height: 65,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: GradientColors.valads,
                   ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, 
//-----------------------------------------------------Função determina distancia entre os textos
                      children: <Widget>[
                        Text(
                          "Definir Horário",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: Icon(
                            Icons.alarm,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      _form.currentState.save();
                      int rng = new Random().nextInt(7);

 //------------------------------------------------Variável que será armazenada no banco de dados
                      var alarmInfo = AlarmInfo(
                        description:  _formData['quantidade'],
                        name: _formData['medicamento'],
                        days: new List.from([2, 3, 4, 5, 6, 7, 1]),
                        color: rng,             
                        );
 //-----------------------------------------------------

 //------------------------------------------------Função usada para vibrar quando o botão for pressionado
              /*DateTime now = DateTime.now().toUtc().add(
                Duration(seconds: 10),
              );
              showNotification(i,now,alarmInfo.name,alarmInfo.description);
              i++;*/
 //-----------------------------------------------------
                    
                      print(_formData);
                       showModalBottomSheet(
                         backgroundColor: Colors.white,
                                  useRootNavigator: true,
                                  context: context,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Container(
                                          padding: const EdgeInsets.all(32),
                                          child: Column(
                                            children: [

//---------------------------------------Função para recolher o horário
                                              FlatButton(
                                                onPressed: () async {
                                                  var selectedTime = await showTimePicker(
                                                    context: context,
                                                    initialTime:TimeOfDay.now(),
                                                    );
                                                  final td = DateTime.now();
                                                  var selectedDateTime =
                                                        DateTime(
                                                            td.year,
                                                            td.month,
                                                            td.day,
                                                            selectedTime.hour,
                                                            selectedTime.minute
                                                                );
                                                  alarmInfo.alarmDateTime = selectedDateTime;
                                                  print(selectedDateTime);
                                                  i = alarmInfo.id;
                                                  if (i == null){
                                                    i = 0;
                                                  }
                                                  await notificationPlugin.scheduleNotification(/*i,selectedDateTime,alarmInfo.name,alarmInfo.description*/);
//---------------------------------------------------------------------
                                               
                                                },
                                                child: Text(
                                                  "Horário",
                                                  style:
                                                      TextStyle(fontSize: 32),
                                                ),
                                              ),

                                              ListTile(
                                                title: Text('Definir os dias'),
                                                trailing: IconButton(
                                                  icon: Icon(Icons.arrow_forward_ios, size: 20),
                                                  color: Colors.black,
                                                  onPressed: () async {
                                                    namaste = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Horario()));
                                                  },
                                                ),
                                              ),

                                              FloatingActionButton.extended(
                                                foregroundColor: Colors.black54,
                                                backgroundColor: Colors.cyan,

 //------------------------------------------------Função responsável por alocar os valores digitados na DB
                                                onPressed: () async {
                                                  print(namaste);
                                                  List <int> nova = new List.from([]);
                                                  nova = namaste.cast<int>();
                                                  alarmInfo.days = nova;

                                                  _dataInit.insertAlarm(alarmInfo);
                                                  
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  },
//-----------------------------------------------------------------------------------------------------

                                                icon: Icon(Icons.alarm),
                                                label: Text('Save'),
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}