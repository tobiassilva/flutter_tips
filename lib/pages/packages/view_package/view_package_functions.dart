import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/packages/globals_packages.dart';

class ViewPackageFunctions {
  BuildContext context;
  ViewPackageFunctions(this.context);


  late String categoriaPackage;

  Future iniciaPage(_jsonRecebido) async {
    GlobalsPackages().categoriasPackages.forEach((element) { 
      if(element['id'] == _jsonRecebido['infos'].idCategoria) {
        categoriaPackage = element['nome'];
        return;
      }
    });
    return;
    
  }
  
}