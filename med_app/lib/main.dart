import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/navBar.dart';
  
final  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
  FlutterLocalNotificationsPlugin();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    var androidInitiliaze = new AndroidInitializationSettings('ic_launcher');
    var iosInitialize = new IOSInitializationSettings( 
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
    var initializationSettings = new InitializationSettings(androidInitiliaze, iosInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  /*Future showNotification() async{
    var androidDetails = new AndroidNotificationDetails("channelId", "channelName", "channelDescription");
    var generalNotification = new NotificationDetails(android: androidDetails);
    await localnotification.show();
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Assistant',
      theme: ThemeData(
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
