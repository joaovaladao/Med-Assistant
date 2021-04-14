import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/horario.dart';
import 'alarm_info.dart';
import 'package:med_app/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Cadastro extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData =
      {}; //----------Variável que armazena todos os dados do cadastro

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
                  //--------Funções para inserir os dados
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
                      _formData['medicamento'] = value, //------Salva o nome
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
                  //--------Funções para inserir os dados
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
                      _formData['quantidade'] = value, //------Salva o nome
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
                  //--------Funções para inserir os dados
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
                      _formData['duração'] = value, //------Salva o nome
                ),
              ),
              Container(
                //-----------Cria botão de cancelar
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
                //-----------Cria botão de agendar o horário
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
                          .spaceBetween, //---------Espaço entre os textos
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
                      showNotification();
                      print(_formData);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Horario()),
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
