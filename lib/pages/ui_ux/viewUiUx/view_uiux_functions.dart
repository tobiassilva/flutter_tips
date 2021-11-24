import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/packages/globals_packages.dart';
import 'package:flutter_tips/pages/ui_ux/globals_ui_ux.dart';

class ViewUiUxFunctions {
  BuildContext context;
  ViewUiUxFunctions(this.context);


  late String categoria;

  Future iniciaPage(_jsonRecebido) async {
    GlobalsUiUx().categorias.forEach((element) { 
      if(element['id'] == _jsonRecebido['infos'].idCategoria) {
        categoria = element['nome'];
        return;
      }
    });
    return;
    
  }
  
}