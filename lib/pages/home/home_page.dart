import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/pages/home/home_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalsStyles().secundaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: HomeWidgets(context).homeWidgetsPrincipal(),
      ),
    );
  }
}
