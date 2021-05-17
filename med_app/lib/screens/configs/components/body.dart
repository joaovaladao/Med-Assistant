import 'package:flutter/material.dart';
//import 'package:med_app/constants.dart';
import 'package:med_app/screens/configs/components/option_models.dart';
import 'package:med_app/screens/configs/components/musicas.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  int selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: options.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0){
            return SizedBox(height: 15.0);
          }else if (index == options.length + 1){
            return SizedBox(height: 100.0);
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: selectedOption == index - 1
              ? Border.all(color: Colors.black26)
              : null,
            ),
            child: ListTile(
              leading: options[index - 1].icon,
              title: Text(
                options[index - 1].title,
                style: TextStyle(
                  color:  selectedOption == index - 1 ? Colors.black : Colors.grey[600],
                ),
              ),
              subtitle: Text(
                options[index - 1].subtitle, 
                style: TextStyle(
                  color: selectedOption == index - 1 ? Colors.black : Colors.grey,
                ),
              ),
              //selected = selectedOption == index - 1,
              onTap: (){
                setState(() {
                  selectedOption = index - 1;
                  if(selectedOption ==  0){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Musicas()));
                  }
                });
                
              }
            ),
          );
        },
      )
    );/*
    bottomSheet: Container(
      width: double.infinity,
      height: 80.0,
      color: Color(0xFFF3F3F3),
      child: Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'SAVE AND CONTINUE',
              style: TextStyle(
                color: Colors.black, 
                fontSize: 18.0,
              ),
            ),
            SizedBox(width: 8.0),
            Icon(
              Icons.arrow_forward_ios,
              color:Colors.black,
              size: 18.0,
            ),
          ],
        ),
      ),
    );*/
  }
}