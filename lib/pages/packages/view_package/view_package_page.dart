import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/pages/packages/view_package/view_package_functions.dart';
import 'package:provider/provider.dart';

import 'widgets/view_packages_widgets.dart';


class ViewPackagePage extends StatefulWidget {
  var _jsonPackage;
  ViewPackagePage(this._jsonPackage);

  @override
  _ViewPackagePageState createState() => _ViewPackagePageState(_jsonPackage);
}

class _ViewPackagePageState extends State<ViewPackagePage> with TickerProviderStateMixin{
  
  var _jsonPackage;
  _ViewPackagePageState(this._jsonPackage);

  late AnimationController _animationController;
  var _bottomNavIndex = 0;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.remove_red_eye_sharp,
    Icons.info,
  ];

  final iconTextList = [
    "Visualizar",
    "Infos",
  ];

  late ViewPackageFunctions viewPackageFunctions;
  
  @override
  void initState() {

    /*final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: GlobalsStyles().tertiaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);*/

    _animationController = AnimationController(
      duration: Duration(seconds: 1), vsync: this,
      
    );

    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(milliseconds: 1),
      () => _animationController.forward(),
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    viewPackageFunctions = Provider.of<ViewPackageFunctions>(context);
    _iniciaPage();
    super.didChangeDependencies();
  }

  Future _iniciaPage() async {
    await viewPackageFunctions.iniciaPage(_jsonPackage);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GlobalsStyles().fontePrincipal),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: GlobalsStyles().secundaryColor,
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: _bottomNavIndex == 0
            ? ViewPackagesWidgets(context).viewPackagesWidgets(_jsonPackage["codigo"]) : 
            _bottomNavIndex == 1 ? ViewPackagesWidgets(context).infosPackagesWidgets(_jsonPackage["infos"])
            : _bottomNavIndex == 2 ? ViewPackagesWidgets(context).codePackagesWidgets("${_jsonPackage["infos"].caminhoCodigo}") : Container(),
          ),

          //TAB
          
          floatingActionButton: ScaleTransition(
            scale: animation,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: GlobalsStyles().primaryColor,
              child: Icon(
                Icons.code,
                color: _bottomNavIndex == 2 ? GlobalsStyles().textColorSecundaryTransp : GlobalsStyles().tertiaryColor,
              ),
              onPressed: () {
                /*_animationController.reset();
                _animationController.forward();*/
                setState(() => _bottomNavIndex = 2);
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? GlobalsStyles().primaryColor : GlobalsStyles().textColorSecundary;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 30,
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "${iconTextList[index]}",
                      maxLines: 1,
                      style: TextStyle(color: color),
                    ),
                  )
                ],
              );
            },

              activeIndex: _bottomNavIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.defaultEdge,
              onTap: (index) => setState(() {
                _bottomNavIndex = index;
                print("index =>>> $index");
              } ),
              //other params
            splashColor: GlobalsStyles().primaryColor,
            leftCornerRadius: 15,
            rightCornerRadius: 15,
            
            backgroundColor: GlobalsStyles().tertiaryColor,
            
            //notchAndCornersAnimation: animation,
            //splashSpeedInMilliseconds: 300,
              
          ),
        ),
      ),
    );
  }
}