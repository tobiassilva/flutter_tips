import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:nice_intro/nice_intro.dart';

class NiceIntroCode extends StatefulWidget {
  const NiceIntroCode({ Key? key }) : super(key: key);

  @override
  _NiceIntroCodeState createState() => _NiceIntroCodeState();
}

class _NiceIntroCodeState extends State<NiceIntroCode> {

  @override
  Widget build(BuildContext context) {
    
    var _introScreens = IntroScreens(
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PaginaSeguinte())
      ),

      onSkip: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PaginaSeguinte())
      ),

      skipText: 'Pular',
      footerPadding: EdgeInsets.zero,

      slides: [
        IntroScreen(
          title: "Bem-vindo",
          description: "Conheça nosso Aplicativo e suas Funcionalidades",
          imageAsset: 'assets/images/packages/app_installation-512.png',
          headerPadding: EdgeInsets.only(left: 60, right: 60)
        ),
        IntroScreen(
          title: "Fale Conosco",
          description: "Estamos Sempre prontos para bater um papo",
          imageAsset: 'assets/images/packages/Telecommuting_pana-300.png',
          headerPadding: EdgeInsets.only(left: 60, right: 60)
        ),
        IntroScreen(
          title: "Gostou?",
          description: "Agora é mão na massa",
          imageAsset: 'assets/images/packages/Team_pana-300.png',
          headerPadding: EdgeInsets.only(left: 60, right: 60)
        ),
      ],
    );
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GlobalsStyles().fontePrincipal
      ),
      home: Scaffold(
        body: _introScreens
      ),
    );
  }
}

class PaginaSeguinte extends StatelessWidget {
  const PaginaSeguinte({ Key? key }) : super(key: key);

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
            child: Text('Voltar', style: TextStyle(color: Colors.white, fontSize: 25),),
          ),
        ),
      ),
    );
  }
}