import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';

import 'home_packages_widgets.dart';

class HomePackagesPage extends StatefulWidget {
  const HomePackagesPage({ Key? key }) : super(key: key);

  @override
  _HomePackagesPageState createState() => _HomePackagesPageState();
}

class _HomePackagesPageState extends State<HomePackagesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: GlobalsStyles().secundaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: HomePackagesWidgets(context).homePackagesWidgetsPrincipal(),
        ),
      ),
    );
  }
}