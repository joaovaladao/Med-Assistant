  import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});

}

final options = [
  Option(
    icon: Icon(Icons.audiotrack_sharp, size: 40.0),
    title: 'Toques',
    subtitle: 'Escolher toques para o alarm.',
  ), 
  Option(
    icon: Icon(Icons.help, size: 40.0),
    title: 'Help',
    subtitle: 'Sobre o aplicativo.',
  ),
  Option(
    icon: Icon(Icons.account_circle, size: 40.0),
    title: 'Option Three',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  Option(
    icon: Icon(Icons.invert_colors, size: 40.0),
    title: 'Option Four',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
  Option(
    icon: Icon(Icons.watch_later, size: 40.0),
    title: 'Option Five',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),      
  Option(
    icon: Icon(Icons.dashboard, size: 40.0),
    title: 'Option Six',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),                                     //musica
  Option(
    icon: Icon(Icons.local_airport, size: 40.0),
    title: 'Option Seven',
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
];
