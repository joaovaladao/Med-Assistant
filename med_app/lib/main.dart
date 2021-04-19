import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/navBar.dart';
  
  //--------------------Iniciando o pacote de notificação;
final  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
  FlutterLocalNotificationsPlugin();    
  //------------------------------------------------
  
  //--------------------Main;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    var androidInitiliaze = new AndroidInitializationSettings('ic_launcher');
    var iosInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(androidInitiliaze, iosInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Assistant',
      theme: ThemeData(
        unselectedWidgetColor: Colors.white60,
        scaffoldBackgroundColor: darkBackground,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}
  //------------------------------------------------
