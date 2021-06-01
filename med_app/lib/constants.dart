import 'package:flutter/material.dart';

// Arquivo para adicionar constantes com o objetivo de facilitar mudanças

// ----------------- Paleta de cores do app -----------------

// Cores de fundo
const darkerBackground = Color(0xFF1C272B);
const darkBackground = Color(0xFF283339);
const neutralBackground = Color(0xFF2c3941);
const lightBackground = Color(0xFF303E47);
const lighterBackground = Color(0xFF35454D);

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
//
class ColorsApp {
  final List<Color> colors;
  ColorsApp(this.colors);

  static Color app0 = Colors.white38;
  static Color app1 = Color(0xFF7159FF);
  static Color app2 = Color(0xFF61A3FE);
  static Color app3 = Color(0xFF13B5B5);
  static Color app4 = Color(0xFFF39E38);
  static Color app5 = Color(0xFFC46197);
  static Color app6 = Color(0xFF62AB0F);
  static Color app7 = Color(0xFF2a9160);
}

//--------------------------------------------Função para retornar as cores de cada alarme
class ColorsTemplate {
  static List<Color> colorsTemplate = [
    ColorsApp.app0,
    ColorsApp.app1,
    ColorsApp.app2,
    ColorsApp.app3,
    ColorsApp.app4,
    ColorsApp.app5,
    ColorsApp.app6,
    ColorsApp.app7
  ];
}

const testes1 = Color(0xFF7159FF);
const testes2 = Color(0xFF61A3FE);
const testes3 = Color(0xFF13B5B5);
const testes4 = Color(0xFFF39E38);
const testes5 = Color(0xFFC46197);
const testes6 = Color(0xFF62AB0F);

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
  static List<Color> cleanSky = [Colors.blue, Colors.white];
  static List<Color> avela = [Colors.green, Colors.white];
  static List<Color> verdao = [Colors.green, Colors.green];
  static List<Color> valads = [Colors.purple, Colors.lightBlue];
  static List<Color> semcor = [Colors.white10, Colors.white24];
  static List<Color> serrinha = [Color(0xFF3caaf0), Color(0xFF3caaf0)];
  static List<Color> orange = [Colors.orange, Colors.orange];
  static List<Color> calendar = [Colors.lightBlueAccent, Colors.blueAccent];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
    GradientColors(GradientColors.cleanSky),
    GradientColors(GradientColors.avela),
    GradientColors(GradientColors.valads),
    GradientColors(GradientColors.serrinha),
  ];
}
//------------------------------------------------
