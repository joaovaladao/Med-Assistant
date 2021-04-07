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
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(  //--------Funções para inserir os dados
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20)
                    ),
                  onSaved: (value) => _formData['name'] = value,    //------Salva o nome
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Quantidade"
                    ),
                  onSaved: (value) => _formData['quantidade'] = value,    //-------Salva a quantidade
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Dias",
                    labelStyle: TextStyle(color: Colors.white),
                    ),
                  onSaved: (value) => _formData['dias'] = value,    //---------Salva os dias
                ),
                Container(          //-----------Criar os botões
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      "Remover dados",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}