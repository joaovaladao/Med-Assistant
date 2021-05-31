import 'package:med_app/screens/home/home.dart';
import 'package:med_app/screens/medicacoes/medicacoes.dart';
import 'package:med_app/screens/historico/historico.dart';
import 'package:med_app/screens/configs/configs.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:med_app/constants.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Medicacoes(), Historico(), Configs()];

//-------------------------------------Função que direciona para a página selecionada
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
//------------------------------------------------

//-------------------------------------Arquitetura
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: Stack(children: <Widget>[
          Container(
            height: size.height * 0.1,
            child: Container(
              decoration: BoxDecoration(
                  color: darkerBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
            ),
          ),
//------------------------------------------------

//-------------------------------------Funções BottonNavigationBar
          Container(
              height: size.height * 0.1,
              child: SalomonBottomBar(
                currentIndex: _currentIndex,
                onTap: onTappedBar,
                items: [
                  // Home
                  SalomonBottomBarItem(
                    icon: Icon(Icons.home),
                    title: Text("Home"),
                    selectedColor: lightBlue,
                    unselectedColor: neutralGray,
                  ),

                  // Medicacoes
                  SalomonBottomBarItem(
                    icon: Icon(Icons.medical_services),
                    title: Text("Medicações"),
                    selectedColor: neutralGreen,
                    unselectedColor: neutralGray,
                  ),

                  // Historico
                  SalomonBottomBarItem(
                    icon: Icon(Icons.access_time_rounded),
                    title: Text("Histórico"),
                    selectedColor: neutralBlue,
                    unselectedColor: neutralGray,
                  ),

                  // Configuracoes
                  SalomonBottomBarItem(
                      icon: Icon(Icons.settings),
                      title: Text("Configurações"),
                      selectedColor: neutralCyan,
                      unselectedColor: neutralGray),
                ],
              ),
            ),
//------------------------------------------------
        ]));
  }
}
