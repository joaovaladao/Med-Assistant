import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/medicacoes/components/cadastro.dart';
//import 'alarm_info.dart';

class Horario extends StatefulWidget {
  @override
  _HorarioState createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getDias();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Dias da semana'),
        backgroundColor: neutralBlue,
      ),*/
      body: new ListView.builder(
          itemCount: checkBoxListTileModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  new CheckboxListTile(
                      activeColor: neutralBlue,
                      dense: true,
                      title: new Text(
                        checkBoxListTileModel[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                      value: checkBoxListTileModel[index].isCheck,
                      onChanged: (bool val) {
                        itemChange(val, index);
                      }),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List lista = funcaoRetorno(checkBoxListTileModel);
          Retorno retorno = Retorno(listaFinal: lista);
          print(lista);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cadastro()));
        },
        backgroundColor: neutralCyan,
        label: Text('Continuar'),
        icon: const Icon(Icons.arrow_forward),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}
class Retorno{
  var listaFinal = new List();

  List get listaFi{
    return listaFinal;
  }

  set listaF(List lista){
    listaFinal = lista;
  }
  Retorno({this.listaFinal});
}

class CheckBoxListTileModel {
  int dia;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.dia, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getDias() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(dia: 2, title: 'Segunda-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 3, title: 'Terça-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 4, title: 'Quarta-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 5, title: 'Quinta-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 6, title: 'Sexta-Feira', isCheck: false),
      CheckBoxListTileModel(dia: 7, title: 'Sábado', isCheck: false),
      CheckBoxListTileModel(dia: 1, title: 'Domingo', isCheck: false),
    ];
  }
}
  
List funcaoRetorno (List<CheckBoxListTileModel> check) {
    var list = new List();
    if (check[0].isCheck == true){
      list.add(check[0].dia);
    }
    if (check[1].isCheck == true){
      list.add(check[1].dia);
    }
    if (check[2].isCheck == true){
      list.add(check[2].dia);
    }
    if (check[3].isCheck == true){
      list.add(check[3].dia);
    }
    if (check[4].isCheck == true){
      list.add(check[4].dia);
    }
    if (check[5].isCheck == true){
      list.add(check[5].dia);
    }
    if (check[6].isCheck == true){
      list.add(check[6].dia);
    }
    //List list = [check[0].dia, check[1].dia, check[2].dia,check[3].dia, check[3].dia,check[4].dia, check[5].dia,check[6].dia];
    return list;
}
