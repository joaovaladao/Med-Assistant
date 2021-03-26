import 'package:flutter/material.dart';

// Arquivo para adicionar constantes com o objetivo de facilitar mudanças

// ----------------- Paleta de cores do app -----------------

// Cores de fundo
const darkerBackground = Color(0xFF1C272B);
const darkBackground = Color(0xFF283339);
const neutralBackground = Color(0xFF2c3941);
const lightBackground = Color(0xFF303E47);

// Verdes
const darkGreen = Color(0xFF2a9160);
const neutralGreen = Color(0xFF2abe78);
const lightGreen = Color(0xFF1fe688);
// Azuis
const neutralBlue = Color(0xFF3caaf0);
const lightBlue = Color(0xFF7dd7e9);
// Cianos
const darkCyan = Color(0xFF149696);
const neutralCyan = Color(0xFF13B5B5);
// Laranja
const neutralOrange = Color(0xFFe6961f);
// Cinzas
const darkGray = Color(0xFF595f67);
const neutralGray = Color(0xFF969ca0);
const lightGray = Color(0xFFb9b9b9);
// Accent dos cards
const testes1 = Color(0xFF28E194);
const testes2 = Color(0xFFFFBB5E);
const testes3 = Color(0xFFFF815E);

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}
