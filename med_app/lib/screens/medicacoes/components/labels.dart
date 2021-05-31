import 'package:flutter/material.dart';
import '../../../constants.dart';

class Labels extends StatelessWidget {
  const Labels({
    Key key,
    @required Map<String, String> formData,
  }) : _formData = formData, super(key: key);

  final Map<String, String> _formData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding:
          const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      decoration: BoxDecoration(
        color: lighterBackground,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextFormField(
 //---------------------------------------------------Funções para inserir os dados
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Nome",
            labelStyle: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w400,
                fontSize: 18)),
        style: TextStyle(color: Colors.white),
        onSaved: (value) =>
            _formData['medicamento'] = value, 
 //-----------------------------------------------------Salva o nome
      ),
    );
  }
}

class Seclabel extends StatelessWidget {
  const Seclabel({
    Key key,
    @required Map<String, String> formData,
  }) : _formData = formData, super(key: key);

  final Map<String, String> _formData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding:
          const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      decoration: BoxDecoration(
        color: lighterBackground,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextFormField(
 //-----------------------------------------------------Funções para inserir os dados
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Quantidade",
            labelStyle: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w400,
                fontSize: 18)),
        style: TextStyle(color: Colors.white),
        onSaved: (value) =>
            _formData['quantidade'] = value, 
 //-----------------------------------------------------Salva a quantidade
      ),
    );
  }
}

class Thirlabel extends StatelessWidget {
  const Thirlabel({
    Key key,
    @required Map<String, String> formData,
  }) : _formData = formData, super(key: key);

  final Map<String, String> _formData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding:
          const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      decoration: BoxDecoration(
        color: lighterBackground,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextFormField(
 //-----------------------------------------------------Funções para inserir os dados
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Duração",
            labelStyle: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w400,
                fontSize: 18)),
        style: TextStyle(color: Colors.white),
        onSaved: (value) =>
            _formData['duração'] = value, 
 //-----------------------------------------------------Salva o nome
      ),
    );
  }
}