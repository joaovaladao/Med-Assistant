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
                  if(selectedOption ==  1){
                    showModalBottomSheet<void>(
                      context: context,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(height: 10),
                                const Text('Med Assistence', style: TextStyle(fontSize: 20),),
                                Text("Vers??o 0.1 -------- Atualizada 17/05/2021"),
                                SizedBox(height: 15),
                                Text("Como cadastrar um novo medicamento:", style: TextStyle(fontSize: 18), textAlign: TextAlign.start),
                                Text("  1 -Toque no segundo ??cone da appbar com o s??mbolo de uma\n  maleta de rem??dios chamada Medica????es\n  2 - Toque no ??cone de mais(+) na parte inferior direita da p??gina\n  3 - Informe o nome quantidade e a dura????o, e depois selecione o\n  bot??o de Definir Hor??rio\n  4 - Toque em hor??rio e selecione um hor??rio\n  5 - Toque na seta(>) localizada na linha abaixo de cadastro para\n  selecionar os dias\n  6 - Selecione os dias desejados e depois selecione o bot??o de\n  salvar\n  7 - Recarregue a p??gina S2"),
                                SizedBox(height: 15),
                                ElevatedButton(
                                  child: const Text('Close'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                Spacer(),
                              ],
                            ),
                        );
                      },
                    );
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