import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
/*
class Option_1 {
  bool val;
  bool val_1;
  bool val_2;

  Option_1({this.val, this.val_1, this.val_2});

}*/


class Musicas extends StatefulWidget {

  @override
  _MusicasState createState() => _MusicasState();
}

class _MusicasState extends State<Musicas> {


 bool val = true;
 bool val_1 = false;
 bool val_2 = false;

 onSwitchValueChanged(bool newVal){
   setState((){
     val = newVal;
     val_1 = false;
     val_2 = false;
   });
 }
 onSwitchValueChanged_1(bool newVal){
   setState((){
     val_1 = newVal;
     val = false;
     val_2 = false;
   });
 }
 onSwitchValueChanged_2(bool newVal){
   setState((){
     val_2 = newVal;
     val_1 = false;
     val = false;
   });
 }
 @override
 Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: buildAppBar(), preferredSize: Size.fromHeight(65.0)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Container(
            
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.serrinha),
                  ),
            child: Column(
              children: <Widget>[
            Align(
              alignment: Alignment(-1, 0),    
            child: Text(
              'Drama Total',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 24.0,
              ),
            ),),
            Align(
              alignment: Alignment(1,0),
              child: Switch(
              value: val,
              onChanged: (newVal){
                if(val == false)
                onSwitchValueChanged(newVal);
              },
          ),),]
          ),
          
          
          ),
          Container(
            
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.serrinha),
                  ),
            child: Column(
              children: <Widget>[
            Align(
              alignment: Alignment(-1, 0),    
            child: Text(
              'MUSICA_2',
              style: TextStyle(
                color: Colors.black, 
                fontSize: 24.0,
              ),
            ),),
            Align(
              alignment: Alignment(1,0),
              child: Switch(
              value: val_1,
              onChanged: (newVal){
                if(val_1 == false)
                onSwitchValueChanged_1(newVal);
              }
              
          ),),]
          ),
          
          
          ),
          Container(
            
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.serrinha),
                  ),
            child: Column(
              children: <Widget>[
            Align(
              alignment: Alignment(-1, 0),    
            child: Text(
              'MUSICA_3',
              style: TextStyle(
                color: Colors.black, 
                fontSize: 24.0,
              ),
            ),),
            Align(
              alignment: Alignment(1,0),
              child: Switch(
              value: val_2,
              onChanged: (newVal){
                if(val_2 == false)
                onSwitchValueChanged_2(newVal);
              }
              
          ),),]
          ),
          
          
          ),
          ]
        ),
      ),
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
    backgroundColor: darkCyan,
    elevation: 0,
  );
}
