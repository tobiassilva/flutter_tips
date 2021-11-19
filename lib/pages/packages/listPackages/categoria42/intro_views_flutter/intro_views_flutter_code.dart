import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroViewsFlutterCode extends StatelessWidget {

  final pages = [
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            end: FractionalOffset.bottomCenter,
            begin: FractionalOffset.topCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent
            ]
          ),
        ),
      ),
      bubble: Image.asset('assets/images/packages/Scrapbooking_pana-400.png'),
      body: const Text(
        'Procurando os melhores lugares? Aí é com a gente mesmo!',
        textAlign: TextAlign.center,
      ),
      title: const Text(
        'Bora Viajar?',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.white),
      bodyTextStyle: const TextStyle(color: Colors.white),
      mainImage: Image.asset(
        'assets/images/packages/Scrapbooking_pana-400.png',
        height: 280,
        width: 280,
        alignment: Alignment.center
      ),
    ),

    
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/images/packages/Current_location-400.png',
      body: const Text(
        'Escolha para onde ir, do conforto da sua casa',
        textAlign: TextAlign.center,
      ),
      title: const Text(
        'Achou?',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.white),
      bodyTextStyle: const TextStyle(color: Colors.white),
      mainImage: Image.asset(
        'assets/images/packages/Current_location-400.png',
        height: 280,
        width: 280,
        alignment: Alignment.center
      ),
    ),

    
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            end: FractionalOffset.bottomCenter,
            begin: FractionalOffset.topCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.orange,
              Colors.pinkAccent,
            ]
          ),
        ),
      ),
      iconImageAssetPath: 'assets/images/packages/London_amico-400.png',
      body: const Text(
        'Agora só aproveitar, que o resto é com a gente :)',
        textAlign: TextAlign.center,
      ),
      title: const Text(
        'Prontinho!',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(color: Colors.white),
      bodyTextStyle: const TextStyle(color: Colors.white),
      mainImage: Image.asset(
        'assets/images/packages/London_amico-400.png',
        height: 280,
        width: 280,
        alignment: Alignment.center
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ComforterBrush'),
      home: Builder(
        builder: (_) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: (){
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => PaginaSeguinte())
            );
          },

          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18
          )

        ),
      ),
      
    );
  }
}

class PaginaSeguinte extends StatelessWidget {
  const PaginaSeguinte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: Text(
              'Voltar',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}