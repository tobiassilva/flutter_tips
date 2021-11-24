

import 'package:flutter_tips/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/packages/listPackages/categoria42/intro_views_flutter/intro_views_flutter_code.dart';
import 'package:flutter_tips/pages/packages/view_package/view_package_functions.dart';
import 'package:provider/provider.dart';

import 'globals/globals_vars.dart';
import 'pages/ui_ux/viewUiUx/view_uiux_functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        //Functions
        Provider<ViewPackageFunctions>(create: (_) => ViewPackageFunctions(context),),
        Provider<ViewUiUxFunctions>(create: (_) => ViewUiUxFunctions(context),),
      ],
      child: MaterialApp(
        title: 'Flutter Tips',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          fontFamily: GlobalsStyles().fontePrincipal
        ),
        home: HomePage(),
      ),
    );
  }
}
