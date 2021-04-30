import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

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
          print(lista);
          Navigator.pop(
              context,
              lista);
        },
        backgroundColor: neutralCyan,
        label: Text('Continuar'),
        icon: const Icon(Icons.arrow_forward),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
//---------------------------------------Função para definir o estada (concertar)
  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}
//---------------------------------------------------------------------

//---------------------------------------Classe CheckBox
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
//---------------------------------------------------------------------


//---------------------------------------Função que retorna os dias selecionados em forma de lista
List funcaoRetorno (List<CheckBoxListTileModel> check) {
    var list = new List();
    int contador = 0;

    while(contador<7){
      if (check[contador].isCheck == true){
        list.add(check[contador].dia);
      }
      contador++;
    }
    return list;
}
//---------------------------------------------------------------------
