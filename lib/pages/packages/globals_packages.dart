import 'listPackages/categoria42/intro_views_flutter/intro_views_flutter_code.dart';
import 'listPackages/categoria42/intro_views_flutter/intro_views_flutter_infos.dart';
import 'listPackages/categoria42/nice_intro/nice_intro_code.dart';
import 'listPackages/categoria42/nice_intro/nice_intro_infos.dart';
import 'listPackages/categoria80/liquid_swipe/liquid_swipe_code.dart';
import 'listPackages/categoria80/liquid_swipe/liquid_swipe_infos.dart';

class GlobalsPackages {
  List categoriasPackages = [
    //a
    //b
    {
      "id": 10,
      "nome": "Bottom Bar",
      "opcoes": [

      ]
    },
    //c
    //d
    //e
    //f
    //g
    //h
    //i
    {
      "id": 42,
      "nome": "Intro / splash",
      "opcoes": [
        {
          "codigo": IntroViewsFlutterCode(),
          "infos": IntroViewsFlutterInfos(),
          "idCategoria": 42,
        },
        {
          "codigo": NiceIntroCode(),
          "infos": NiceIntroInfos(),
          "idCategoria": 42,
        },
      ],
    },
    //j
    //k
    //l
    //m
    //n
    //o
    //p
    //q
    //r
    //s
    //t
    {
      "id": 74,
      "nome": "Tab Bar",
      "opcoes": [

      ]
    },
    {
      "id": 80,
      "nome": "Transação de Páginas",
      "opcoes": [
        {
          "codigo": LiquidSwipeCode(),
          "infos": LiquidSwipeInfos(),
          "idCategoria": 80,
        },
      ]
    },
    //u
    //v
    //w
    //x
    //y
    //z
  ];
}

/* CAMPOS PACKAGES CODE
//deixar '' quando nao tiver algum campo
  String caminhoCodigo = '';

  String nome = '';
  String versaoPackage = '';
  String linkPackage = '';
  String linkGitHub = '';
  String linkYoutube = '';
  int idCategoria = 1;

  
  String observacoes = """
  """; 
*/