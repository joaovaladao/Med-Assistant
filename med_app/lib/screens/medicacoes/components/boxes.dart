import 'package:flutter/material.dart';
import '../../../constants.dart';

class Boxes extends StatelessWidget {
  final String name;
  const Boxes({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
    //-------------------------Nome do alarme
        Text(
          name,
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
    );
  }
}


class Days extends StatelessWidget {
  final List<int> days;
  const Days({
    Key key, this.days,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      weekdayDate(days),
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
    );
  }

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