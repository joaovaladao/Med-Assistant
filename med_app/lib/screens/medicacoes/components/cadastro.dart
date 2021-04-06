import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:med_app/constants.dart';
//import 'alarm_info.dart';


class Cadastro extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        actions: <Widget>[
          IconButton(
           icon: Icon(Icons.save),
           onPressed: () {  //-------Botão de salvar, quando selecionado printa os dados no terminal
             _form.currentState.save();
             Navigator.of(context).pop();
           }
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(  //--------Funções para inserir os dados
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Nome"
                  ),
                onSaved: (value){
                  print(value);
                },
              ),
              TextFormField(
               style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Quantidade"
                  ),
                onSaved: (value){
                  print(value);
                },
              ),
              TextFormField(
               style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Dias"
                  ),
                onSaved: (value){
                  print(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}