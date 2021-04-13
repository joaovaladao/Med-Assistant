// Dedicado à pagina de medicacoes
import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';
import 'package:med_app/screens/medicacoes/components/body.dart';
import 'components/cadastro.dart';

class Medicacoes extends StatefulWidget {
  @override
  _MedicacoesState createState() => _MedicacoesState();
}

class _MedicacoesState extends State<Medicacoes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: buildAppBar(), preferredSize: Size.fromHeight(65.0)),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cadastro()));
        },
        splashColor: lightGreen,
        backgroundColor: neutralGreen,
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
    backgroundColor: darkGreen,
    elevation: 0,
  );
}

