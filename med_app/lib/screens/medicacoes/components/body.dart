import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
import 'alarm_info.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(padding: EdgeInsets.only(top: 8)),
        Expanded(
            child: ListView(
          children: alarms.map((alarm) {
            //-----------Função que mapeia todos os alarmes cadastrados;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: alarm.gradientColors,
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                // ),
                color: lightBackground,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //----------------Row para organizar os dados que vão aparecer primeiro na box
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          //------------- Row para organizar os dados que vão aparecer primeiro na box
                          children: <Widget>[
                            //------------- Nome do alarme
                            Text(
                              alarm.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                        Switch(
                            value: true,
                            activeColor: alarm.color,
                            onChanged: (bool value) {}),
                      ]),
                  //----------------Row para organizar os dados que vão aparecer por ultimo na box
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //------------- Dias da semana
                        Text(
                          weekdayDate(alarm.days),
                          style: TextStyle(
                              color: lightBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        Spacer(flex: 1),
                        //------------- Bolinha
                        Icon(
                          Icons.fiber_manual_record,
                          color: lightBlue,
                          size: 6,
                        ),
                        Spacer(flex: 1),
                        //------------- Horario
                        Text(
                          DateFormat.Hm().format(alarm.alarmDateTime),
                          style: TextStyle(
                              color: alarm.color,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        Spacer(flex: 20),
                        //------------- Seta pra baixo
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 28,
                        ),
                        Spacer(flex: 1),
                      ])
                ],
              ),
            );
          }).toList(), //----------função para retornar uma lista, e assim acessarmos todos os itens
        ))
      ],
    );
  }

  //------------- Metodo para retornar a sequencia de dias da semana a partir de uma lista de ints
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
