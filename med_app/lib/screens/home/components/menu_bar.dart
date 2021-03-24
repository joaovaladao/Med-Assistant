/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:med_app/screens/home/home.dart';


/// This is the stateful widget that the main application instantiates.
class MenuBar extends StatefulWidget {
  const MenuBar({Key key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MenuBarState extends State<MenuBar> {
  int _selectedIndex = 0;//Index inicial é o 0, refere a página Home.

  final tabs = [
    Center(child: Home(),),//aqui é colocada a página Home
    Center(child: Text('Página não feita', style: TextStyle(color: Colors.white, fontSize: 20)),),//aqui será colocada a página de Medicações
    Center(child: Text('Página não feita', style: TextStyle(color: Colors.white, fontSize: 20)),),//aqui será colocada a página de Histórico

  ];

  void _onItemTapped(int index) {//Função para obter o valor do index.
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabs.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Medicações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
