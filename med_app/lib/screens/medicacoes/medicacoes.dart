// Dedicado à pagina de medicacoes
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/medicacoes/components/body.dart';
import 'components/cadastro.dart';

class Medicacoes extends StatefulWidget {
  @override
  _MedicacoesState createState() => _MedicacoesState();
}

class _MedicacoesState extends State<Medicacoes> {
    /*FlutterLocalNotificationsPlugin localnotification;

  @override
  void initState(){
    super.initState();
    var androidInitiliaze = new AndroidInitializationSettings('ic_launcher');
    var initicializationSettings = new InitializationSettings(android: androidInitiliaze);
    localnotification = new FlutterLocalNotificationsPlugin();
    localnotification.initialize(initicializationSettings);
  }
  void showNotification(){

  }
  @override*/
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
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

AppBar buildAppBar() {
  // Constroi a barra superior do app
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

// child: Container(
//   decoration: BoxDecoration(
//     color: Colors.transparent,
//     borderRadius: BorderRadius.all(
//       Radius.circular(100),
//     ),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.black.withOpacity(0.),
//         spreadRadius: 7,
//         blurRadius: 7,
//         offset: Offset(3, 5),
//       ),
//     ],
//   ),
// ),
