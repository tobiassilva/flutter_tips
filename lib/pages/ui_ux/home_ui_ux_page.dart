import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';

import 'home_ui_ux_widget.dart';


class HomeUiUxPage extends StatefulWidget {
  const HomeUiUxPage({ Key? key }) : super(key: key);

  @override
  _HomeUiUxPageState createState() => _HomeUiUxPageState();
}

class _HomeUiUxPageState extends State<HomeUiUxPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GlobalsStyles().fontePrincipal),
      home: Scaffold(
        backgroundColor: GlobalsStyles().secundaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: HomeUiUxWidgets(context).homeUiUxWidgetsPrincipal(),
        ),
      ),
    );
  }
}