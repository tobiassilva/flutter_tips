import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var _primaryColor = const Color.fromRGBO(255, 174, 116, 1);
var _secColor = const Color.fromRGBO(91, 146, 140, 1);
var _textpColor = Colors.grey[900];
var _textsColor = Colors.grey[500];

class InstaAnalyticsCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _sizeH = MediaQuery.of(context).size.height;
    double _sizeW = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PublicSansRegular'),
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                height: _sizeH,
                color: _secColor,
              ),
              Container(
                height: _sizeH / 2.3,
                margin: EdgeInsets.only(right: 150, top: 20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(100, 152, 147, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(200),
                      bottomRight: Radius.circular(200)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Insta\nAnalytics",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Let's check the achievements and performance of your Instagram Account!",
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: _sizeW / 5,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                  'assets/images/ui_ux/Pie-chart-pana.png'),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InstaAnalyticsCodeDetails()));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    decoration: BoxDecoration(
                                        color: _primaryColor,
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                                Radius.circular(10))),
                                    child: Text(
                                      'Get Started',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InstaAnalyticsCodeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _sizeH = MediaQuery.of(context).size.height;
    double _sizeW = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PublicSansRegular'),
      home: Scaffold(
        body: Container(
          height: _sizeH,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'anajulia05',
                            style: TextStyle(
                              color: _secColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.keyboard_arrow_down,
                              color: _secColor, size: 15),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/auxiliares/profile1.jpg'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Ana Júlia',
                        style: TextStyle(
                          color: _textpColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _modelText("3,7K", "Followers"),
                          Container(
                            height: 50,
                            width: 2,
                            color: _textsColor,
                          ),
                          _modelText("65", "Post"),
                          Container(
                            height: 50,
                            width: 2,
                            color: _textsColor,
                          ),
                          _modelText("542", "Following"),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Text(
                        'This Week',
                        style: TextStyle(
                          color: _textpColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      _modelButton(
                          context,
                          Icons.file_download_sharp,
                          "287",
                          "Followers Goined",
                          _primaryColor,
                          Colors.white,
                          Colors.white),
                      const SizedBox(
                        height: 10,
                      ),
                      _modelButton(
                          context,
                          Icons.file_upload_sharp,
                          "12",
                          "Followers Lost",
                          Colors.white,
                          _secColor,
                          _textsColor),
                      const SizedBox(
                        height: 10,
                      ),
                      _modelButton(
                          context,
                          FontAwesomeIcons.ban,
                          "16",
                          "Who Blocked You",
                          Colors.white,
                          _secColor,
                          _textsColor),
                    ],
                  ),
                ),
              ),

              //Bottom Bar
              Material(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  width: _sizeW,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: Offset(1, -3),
                        color: Colors.black26
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.home,
                        color: _secColor,
                      ),
                      Icon(
                        FontAwesomeIcons.chartPie,
                        color: _textsColor,
                      ),
                      Icon(
                        FontAwesomeIcons.cog,
                        color: _textsColor,

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _modelText(_text1, _text2) {
    return Column(
      children: [
        Text(
          '$_text1',
          style: TextStyle(
            color: _secColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$_text2',
          style: TextStyle(
            color: _textsColor,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _modelButton(
      _context, _icon, _text1, _text2, _colorFundo, _colorNum, _ColorText) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
      width: MediaQuery.of(_context).size.width,
      decoration: BoxDecoration(
        color: _colorFundo,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _icon,
            color: _ColorText,
            size: 30,
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _text1,
                  style: TextStyle(
                    color: _colorNum,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  _text2,
                  style: TextStyle(
                    color: _ColorText,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
