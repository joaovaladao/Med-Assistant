import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/medicacoes/components/horario.dart';
//import 'alarm_info.dart';


class Cadastro extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};   //----------Variável que armazena todos os dados do cadastro
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                 SizedBox(
                  height: 40,
                ),

                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Text(
                        "Novo Medicamento",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 27),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {  //-------Botão de salvar, quando selecionado printa os dados no terminal
                          Navigator.of(context).pop();   //--------Função que fecha a página
                        }
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.cleanSky,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  child: TextFormField(  //--------Funções para inserir os dados
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Medicamento",
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20)
                      ),
                    style: TextStyle(color: Colors.white),
                    onSaved: (value) => _formData['medicamento'] = value,    //------Salva o nome
                  ),
                ),

                SizedBox(
                  height: 20,                
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.cleanSky,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  child: TextFormField(  //--------Funções para inserir os dados
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Quantidade",
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20)
                      ),
                    style: TextStyle(color: Colors.white),
                    onSaved: (value) => _formData['quantidade'] = value,    //------Salva o nome
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.cleanSky,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  child: TextFormField(  //--------Funções para inserir os dados
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Duração",
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20)
                      ),
                    style: TextStyle(color: Colors.white),                    
                    onSaved: (value) => _formData['duração'] = value,    //------Salva o nome
                  ),
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
                         _form.currentState.save();
                          print(_formData);
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Horario()),
                            );
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