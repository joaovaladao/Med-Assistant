import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/horario.dart';
import 'package:med_app/screens/medicacoes/components/notification.dart';
import 'alarm_info.dart';
import 'dart:math';
import 'labels.dart';

// ignore: must_be_immutable
class Cadastro extends StatelessWidget {
  int i = 0, count = 0;
  DateTime selectedDateTime;
  List namaste;
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getDias();
  final _form = GlobalKey<FormState>();
  var _dataInit = DataInit();
  final Map<String, String> _formData =
      {}; 
  Cadastro({this.namaste});

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
              Labels(formData: _formData),
              SizedBox(
                height: 10,
              ),
              Seclabel(formData: _formData),
              SizedBox(
                height: 10,
              ),
              Thirlabel(formData: _formData),
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
                    onPressed: () async{
                      _form.currentState.save();
                      //int rng = new Random().nextInt(8);
                      int cor = await _dataInit.qtdAlarms();

 //------------------------------------------------Variável que será armazenada no banco de dados
                      var alarmInfo = AlarmInfo(
                        description:  _formData['quantidade'],
                        name: _formData['medicamento'],
                        days: new List.from([2, 3, 4, 5, 6, 7, 1]),
                        color: cor%8,             
                        );
                        print("Color: $cor");
 //-----------------------------------------------------                  
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
                                                  selectedDateTime =
                                                        DateTime(
                                                            td.year,
                                                            td.month,
                                                            td.day,
                                                            selectedTime.hour,
                                                            selectedTime.minute
                                                                );
                                                  alarmInfo.alarmDateTime = selectedDateTime;
                                                  print("Horário: $selectedDateTime");
                                                  if (i == null){
                                                    i = 0;
                                                  }
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
                                                  print("Dias: $namaste");
                                                  List <int> nova = new List.from([]);
                                                  nova = namaste.cast<int>();
                                                  alarmInfo.days = nova;

                                                  i = await _dataInit.insertAlarm(alarmInfo);
                                                  alarmInfo.id = i;
                                                  await notificationPlugin.showDailyAtTime(i,selectedDateTime,alarmInfo.name,alarmInfo.description);
                                                  print("HashID: $i");
                                                  count = await notificationPlugin.getPendingNotificationCount();
                                                  print("Notificações Pendentes: $count");
                                                  
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


