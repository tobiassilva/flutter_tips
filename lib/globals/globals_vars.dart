import 'package:flutter/material.dart';

class Variaveis {
  String linkBaseGithub = 'https://github.com/tobiassilva/flutter_tips/tree/master/';
}

class GlobalsStyles {
  var fontePrincipal = 'PublicSansRegular';
  var primaryColor = const Color.fromRGBO(240, 165, 0, 1);
  var secundaryColor = const Color.fromRGBO(240, 240, 240, 1);
  var tertiaryColor = const Color.fromRGBO(51, 71, 86, 1);

  var cardsColor = const Color.fromRGBO(250, 250, 250, 1);

  var textColorForte = Color(0xFF1C1915);
  var textColorMedio = Color(0xFF797979);
  var textColorFraco = Color(0xFFB5B5B5);
  var textColorSecundary = Colors.white;
  var textColorSecundaryTransp = Colors.white70;

  var sombreado = Colors.black45;

  /// TAMANHO DE TEXTOS
  var sizeTitulo = 24.0;
  var sizeText = 14.0;
  var sizeTextMedio = 16.0;
  var sizeSubtitulo = 18.0;

  var colorGradiente = LinearGradient(
      colors: [ Color.fromRGBO(240, 165, 0, 1), Color.fromRGBO(225, 150, 0, 1)]
  );

}

/*
####
comando para ficar rodando o mobx
flutter packages pub run build_runner watch
*/