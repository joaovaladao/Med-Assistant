import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
//import 'package:med_app/screens/medicacoes/components/horario.dart';
import 'alarm_info.dart';
import 'package:med_app/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';

// ignore: must_be_immutable
class Cadastro extends StatelessWidget {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getDias();
  final _form = GlobalKey<FormState>();
  var _dataInit = DataInit();
  final Map<String, String> _formData =
      {}; 
 //--------------------------------------Variável que armazena todos os dados do cadastro

  Future showNotification() async{  //Função que aciona Notificação ao dispositivo
    var androidDetails = new AndroidNotificationDetails("channelId", "channelName", "channelDescription",
     sound: RawResourceAndroidNotificationSound('drama_total'),
     priority: Priority.High,
     importance: Importance.Max,
     );
    var iosDetails = new IOSNotificationDetails(sound: 'android_music.wav');
    var generalNotification = new NotificationDetails(androidDetails, iosDetails);
    await flutterLocalNotificationsPlugin.show(
      0,
      alarms[0].name,
      alarms[0].description,
      generalNotification,
      );
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
                  //color: neutralBlue,
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
                      showNotification();
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
                                                  onPressed: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.vertical(
                                                          top: Radius.circular(24),
                                                        ),
                                                        ),
                                                      builder: (BuildContext context) {
                                                            return Scaffold(

//----------------------------------------------------------Código da página horário

                                                              body: new ListView.builder(
                                                                  itemCount: checkBoxListTileModel.length,
                                                                  itemBuilder: (BuildContext context, int index) {
                                                                    return Container(
                                                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                                                      child: Column(
                                                                        children: <Widget>[
                                                                          SizedBox(
                                                                            height: 10,
                                                                          ),
                                                                          new CheckboxListTile(
                                                                              activeColor: neutralBlue,
                                                                              dense: true,
                                                                              title: new Text(
                                                                                checkBoxListTileModel[index].title,
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 18,
                                                                                  // fontWeight: FontWeight.w600,
                                                                                ),
                                                                              ),
                                                                              value: checkBoxListTileModel[index].isCheck,
                                                                              onChanged: (bool val) {
                                                                                itemChange(val, index);
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  }),
                                                              floatingActionButton: FloatingActionButton.extended(
                                                                onPressed: () {
                                                                  List lista = funcaoRetorno(checkBoxListTileModel);
                                                                  List <int> nova = new List.from([]);
                                                                  nova = lista.cast<int>();
                                                                  print(lista);
                                                                  alarmInfo.days = nova; 
                                                                  Navigator.pop(context);
                                                                },
                                                                backgroundColor: neutralCyan,
                                                                label: Text('Continuar'),
                                                                icon: const Icon(Icons.arrow_forward),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                              ),
                                                            );
//-----------------------------------------------------------------------------------------------------
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),

                                              FloatingActionButton.extended(
                                                foregroundColor: Colors.black54,
                                                backgroundColor: Colors.cyan,

 //------------------------------------------------Função responsável por alocar os valores digitados na DB
                                                onPressed: () async {
                                                  _dataInit.insertAlarm(alarmInfo);
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

//---------------------------------------Função para definir o estada (concertar)
void itemChange(bool val, int index) {
      checkBoxListTileModel[index].isCheck = val;
  }
//---------------------------------------------------------------------
}

//---------------------------------------Classe CheckBox
class CheckBoxListTileModel {
  int dia;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.dia, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getDias() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(dia: 2, title: 'Segunda-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 3, title: 'Terça-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 4, title: 'Quarta-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 5, title: 'Quinta-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 6, title: 'Sexta-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 7, title: 'Sábado', isCheck: false),
      CheckBoxListTileModel(dia: 1, title: 'Domingo', isCheck: false),
    ];
  }
}
//---------------------------------------------------------------------


//---------------------------------------Função que retorna os dias selecionados em forma de lista
List funcaoRetorno (List<CheckBoxListTileModel> check) {
    var list = new List();
    if (check[0].isCheck == true){
      list.add(check[0].dia);
    }
    if (check[1].isCheck == true){
      list.add(check[1].dia);
    }
    if (check[2].isCheck == true){
      list.add(check[2].dia);
    }
    if (check[3].isCheck == true){
      list.add(check[3].dia);
    }
    if (check[4].isCheck == true){
      list.add(check[4].dia);
    }
    if (check[5].isCheck == true){
      list.add(check[5].dia);
    }
    if (check[6].isCheck == true){
      list.add(check[6].dia);
    }
    return list;
}
//---------------------------------------------------------------------