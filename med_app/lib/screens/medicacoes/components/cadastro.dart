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
                    labelText: "Medicamento",
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20)
                    ),
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) => _formData['medicamento'] = value,    //------Salva o nome
                ),
                SizedBox(
                  height: 20,
                ),
                 TextFormField(  //--------Funções para inserir os dados
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Quantidade",
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20)
                    ),
                  style: TextStyle(color: Colors.white),
                  onSaved: (value) => _formData['quantidade'] = value,    //------Salva o nome
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(  //--------Funções para inserir os dados
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Duração",
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20)
                    ),
                  style: TextStyle(color: Colors.white),                    
                  onSaved: (value) => _formData['duração'] = value,    //------Salva o nome
                ),
                Container(          //-----------Cria botão de cancelar
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      "Remover dados",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    onPressed: () {
                  
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(          //-----------Cria botão de agendar o horário
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.sky,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)), 
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,      //---------Espaço entre os textos
                        children: <Widget>[
                          Text(
                            "Definir Horário",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            child: Icon(
                              Icons.alarm,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          ],
                        ),
                      onPressed: (){
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}