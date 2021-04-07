import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
//import 'alarm_info.dart';


class Cadastro extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};   //----------Variável que armazena todos os dados do cadastro
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: neutralBlue,
        actions: <Widget>[
          IconButton(
           icon: Icon(Icons.save),
           onPressed: () {  //-------Botão de salvar, quando selecionado printa os dados no terminal
             _form.currentState.save();
             print(_formData);
             Navigator.of(context).pop();   //--------Função que fecha a página
           }
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(  //--------Funções para inserir os dados
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Nome"
                  ),
                onSaved: (value) => _formData['name'] = value,    //------Salva o nome
              ),
              TextFormField(
               style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Quantidade"
                  ),
                onSaved: (value) => _formData['quantidade'] = value,    //-------Salva a quantidade
              ),
              TextFormField(
               style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Dias"
                  ),
                onSaved: (value) => _formData['dias'] = value,    //---------Salva os dias
              ),
            ],
          ),
        ),
      ),
    );
  }
}