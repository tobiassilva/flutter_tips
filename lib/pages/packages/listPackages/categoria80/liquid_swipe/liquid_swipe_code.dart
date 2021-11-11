import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class ItensPage {
  LinearGradient colorGrad;
  String image;
  String text1;
  String text2;
  String text3;

  ItensPage(this.colorGrad, this.image, this.text1, this.text2, this.text3);
}

class LiquidSwipeCode extends StatefulWidget {
  const LiquidSwipeCode({Key? key}) : super(key: key);

  @override
  _LiquidSwipeCodeState createState() => _LiquidSwipeCodeState();
}

class _LiquidSwipeCodeState extends State<LiquidSwipeCode> {
  int _pagina = 0;
  late LiquidController liquidController;

  List<ItensPage> data = [
    ItensPage(
        LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
        "assets/images/packages/logo_viagem.png",
        "Olá",
        "Este é",
        "Flutter Tips"),
    ItensPage(
        LinearGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent]),
        "assets/images/packages/logo_viagem.png",
        "Conheça",
        "o package",
        "Liquid Swipe"),
    ItensPage(
        LinearGradient(colors: [Colors.orange, Colors.orangeAccent]),
        "assets/images/packages/logo_viagem.png",
        "Gostou?",
        "Avalie e",
        "Compartilhe!"),
    ItensPage(LinearGradient(colors: [Colors.lime, Colors.limeAccent]),
        "assets/images/packages/logo_viagem.png", "Agora", "é com", "Você!"),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((_pagina) - index).abs(),
      ),
    );
    print(selectedness);
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GlobalsStyles().fontePrincipal),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  //color: data[index].color,
                  decoration: BoxDecoration(gradient: data[index].colorGrad),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        data[index].image,
                        height: MediaQuery.of(context).size.width / 1.6,
                        width: MediaQuery.of(context).size.width / 1.6,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            data[index].text1,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "IrishGrover",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            data[index].text2,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "IrishGrover",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            data[index].text3,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "IrishGrover",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              positionSlideIcon: 0.8,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              onPageChangeCallback: _nextPage,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              fullTransitionValue: 880,
              enableSideReveal: true,
              enableLoop: true,
              ignoreUserGestureWhileAnimating: true,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(

                  children: [
                    FlatButton(
                      onPressed: () {
                        liquidController.jumpToPage(
                            page: liquidController.currentPage + 1 >
                                    data.length - 1
                                ? 0
                                : liquidController.currentPage + 1);
                      },
                      child: Text("Next"),
                      color: Colors.white.withOpacity(0.01),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(data.length, _buildDot),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        liquidController.animateToPage(
                            page: data.length - 1, duration: 700);
                      },
                      child: Text("End"),
                      color: Colors.white.withOpacity(0.01),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _nextPage(int _proxima) {
    setState(() {
      _pagina = _proxima;
    });
  }
}
