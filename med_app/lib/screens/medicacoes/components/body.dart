import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'alarm_info.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: alarms.map((alarm) {  //-----------Função que mapeia todos os alarmes cadastrados;
              return Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: alarm.gradientColors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(  //-------------Row para organizar os dados que vão aparecer primeiro na box
                          children: <Widget>[
                          Icon(Icons.label, color: Colors.white, size: 24,),
                          Text(alarm.name, style: TextStyle(color: Colors.white, fontSize: 20),),
                          SizedBox(width: 8),
                          ],
                        ),
                        Switch(value: true, activeColor: Colors.white, onChanged: (bool value) {}),
                      ]
                    ),
                    Text(alarm.description, style: TextStyle(color: Colors.white),),  //------informação do meio da box
                    Row(  //----------------Row para organizar os dados que vão aparecer por ultimo na box
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[ 
                      Text(DateFormat.jm().format(alarm.alarmDateTime), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 28,),
                      ]
                    )
                  ],
                  ),
              );
            }).toList(),  //----------função para retornar uma lista, e assim acessarmos todos os itens
          )
        )
      ],
    );
  }
}
