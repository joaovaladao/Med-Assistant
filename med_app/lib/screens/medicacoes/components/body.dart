import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/dataInit.dart';
import 'package:med_app/screens/medicacoes/components/notification.dart';
import 'boxes.dart';

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
                    gradient: LinearGradient(colors: GradientTemplate.gradientTemplate[alarm.color].colors),
                    //color: ColorsTemplate.colorsTemplate[alarm.color],
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
                            Boxes(name: alarm.name),
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
                            Days(days: alarm.days),
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
    }
                    
