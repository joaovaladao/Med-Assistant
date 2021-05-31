import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/notification.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  var _dataInit2 = DataInit();
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(padding: EdgeInsets.only(top: 8)),
        Expanded(
          child:FutureBuilder(
            future: _dataInit2.getAlarms(),
            builder: (context, snapshot){
              if(snapshot.hasData)
                return ListView(
                children: snapshot.data.map<Widget>((alarm)  {   //snapshot.data.map<Widget>((alarm)
    //-------------------------Função que mapeia todos os alarmes cadastrados;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  decoration: BoxDecoration(
                    color: ColorsTemplate.colorsTemplate[alarm.color],
    //-------------------------colorsTemplate é uma lista com 6 cores salvas no arquivo de constantes
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
    //--------------------------Row para organizar os dados que vão aparecer primeiro na box
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
    //-------------------------Nome do alarme
                                Text(
                                  alarm.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 6.0,
                                        color: darkerBackground.withAlpha(80),
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                              ],
                            ),
                            Switch(
                                value: true,//alarm.isActive,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    alarm.setActive(value);
                                  });
                                }),
                          ]),
    //-------------------------Row para organizar os dados que vão aparecer por ultimo na box
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
    //-------------------------Dias da semana
                            Text(
                              weekdayDate(alarm.days),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    blurRadius: 6.0,
                                    color: darkerBackground.withAlpha(80),
                                    offset: Offset(1.0, 1.0),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(flex: 1),
    //-------------------------Bolinha
                            Icon(
                              Icons.fiber_manual_record,
                              color: Colors.white,
                              size: 6,
                            ),
                            Spacer(flex: 1),
    //-------------------------Horario
                            Text(
                              DateFormat.Hm().format(alarm.alarmDateTime),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    blurRadius: 6.0,
                                    color: darkerBackground.withAlpha(80),
                                    offset: Offset(1.0, 1.0),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(flex: 20),
//------------------------------------Botão de delete
                            IconButton(
                              icon: Icon(Icons.delete, size: 28),
                              color: Colors.white,
                              onPressed: () async {
                                _dataInit2.deleteAlarms(alarm.id);
                                var id = alarm.id;
                                await notificationPlugin.cancelNotification(alarm.id);
                                var count = await notificationPlugin.getPendingNotificationCount();
                                print("Notificações Pendentes após deleção: $count");
                                print("Id do alarme deletado: $id");
                                                              },
                                                            ),
                                                            Spacer(flex: 1),
                                                          ])
                                                    ],
                                                  ),
                                                );
                                              }).followedBy([
//----------------------------------------------função que adiciona um fundo falso ao descer a aplicação
                                                Container(
                                                  height: 80,
                                                )
                                              ]).toList(),
//------------------------------------------------função para retornar uma lista, e assim acessarmos todos os itens
                                          );
                                
                                        return(Center(
                                          child:Text("Loading...", style: TextStyle(color: Colors.white, fontSize: 20),)
                                          )
                                        );
                                        })),
                                        Container(padding: EdgeInsets.only(bottom: 8)),
                                      ],
                                    );
                                  }
                                
//------------------------------------------Metodo para retornar a sequencia de dias da semana a partir de uma lista de ints
                                  String weekdayDate(List<int> days) {
                                    List<String> weekDays = new List();
                                
                                    if (days.length == 7) {
                                      return 'Todos os dias';
                                    } else {
                                      for (int i = 0; i < days.length; i++) {
                                        switch (days[i]) {
                                          case 1:
                                            weekDays.add('Dom');
                                            break;
                                          case 2:
                                            weekDays.add('Seg');
                                            break;
                                          case 3:
                                            weekDays.add('Ter');
                                            break;
                                          case 4:
                                            weekDays.add('Qua');
                                            break;
                                          case 5:
                                            weekDays.add('Qui');
                                            break;
                                          case 6:
                                            weekDays.add('Sex');
                                            break;
                                          case 7:
                                            weekDays.add('Sáb');
                                            break;
                                        }
                                      }
                                
                                      return weekDays.join(', ');
                                    }
                                  }
                                }
                    
