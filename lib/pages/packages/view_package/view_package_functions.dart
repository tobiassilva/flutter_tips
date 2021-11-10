import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/packages/globals_packages.dart';

class ViewPackageFunctions {
  BuildContext context;
  ViewPackageFunctions(this.context);


  late String categoriaPackage;

  Future iniciaPage(_jsonPackage) async {
    GlobalsPackages().categoriasPackages.forEach((element) { 
      if(element['id'] == _jsonPackage['infos'].idCategoria) {
        categoriaPackage = element['nome'];
        return;
      }
    });
    print('SAIU AQUI;');
    return;
    
  }
  
}