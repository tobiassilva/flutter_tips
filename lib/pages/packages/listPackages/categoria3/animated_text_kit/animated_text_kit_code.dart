import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/globals/globals_widgets.dart';

class AnimatedTextKitCode extends StatelessWidget {
  const AnimatedTextKitCode({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GlobalsStyles().fontePrincipal),
      home: Scaffold(
        //backgroundColor: GlobalsStyles().secundaryColor,
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView(
            children: [
              Row(
                children: [
                  GlobalsWidgets().subtituloComBarra("Lista de Animações de Texto", GlobalsStyles().sizeSubtitulo)
                ],
              ),

              // Rotate
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(
                  children: [
                    Text(
                      'Flutter',
                      style: TextStyle(
                        color: GlobalsStyles().textColorMedio,
                        fontSize: GlobalsStyles().sizeSubtitulo
                      ),
                    ),
    const SizedBox(width: 20.0, height: 100.0),
                    _rotateAnimatedText(),
                  ],
                ),
              ),
              
              Divider(),
              //Fade 
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    _fadeAnimatedText(),
                  ],
                ),
              ),
              
              Divider(),

              //Colorize 
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    Flexible(child: _colorizeAnimatedText()),
                  ],
                ),
              ),
              
              Divider(),

              //Typer 
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    Flexible(child: _typerAnimatedText()),
                  ],
                ),
              ),
              
              Divider(),

              //TextLiquidFill 
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    Flexible(child: _textLiquidFill()),
                  ],
                ),
              ),
              
              Divider(),

              //Typewriter
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    Flexible(child: _typewriterAnimatedText()),
                  ],
                ),
              ),
              
              Divider(),

              //Scale
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    Flexible(child: _scaleAnimatedText()),
                  ],
                ),
              ),
              
              Divider(),

              //Wavy  
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    Flexible(child: _wavyAnimatedText()),
                  ],
                ),
              ),
              
              Divider(),

              //Flicker 
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    Flexible(child: _flickerAnimatedText()),
                  ],
                ),
              ),
              


            ],
          ),
        ),
      ),
    );
  }

  Widget _rotateAnimatedText() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'IrishGrover'
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          RotateAnimatedText('TIPS'),
          RotateAnimatedText('PACKAGES'),
          RotateAnimatedText('UI/UX'),
          RotateAnimatedText('WIDGETS')
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  Widget _fadeAnimatedText() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'PublicSansRegular'
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          FadeAnimatedText('O futuro'),
          FadeAnimatedText('pertence àqueles'),
          FadeAnimatedText('que acreditam'),
          FadeAnimatedText('na beleza'),
          FadeAnimatedText('de seus sonhos.')
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  Widget _colorizeAnimatedText() {
    const _colors = [
      Colors.red,
      Colors.black,
      Colors.purple,
      Colors.blue,
    ];

    final _textStyle = TextStyle(
      fontSize: GlobalsStyles().sizeTitulo,
      fontFamily: 'PublicSansRegular',
      fontWeight: FontWeight.bold
    );

    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'YujiMaiRegular'
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Itachi Uchiha',
            colors: _colors,
            textStyle: _textStyle
          ),
          ColorizeAnimatedText(
            'Minato Namikaze',
            colors: _colors,
            textStyle: _textStyle
          ),
          ColorizeAnimatedText(
            'Sasori',
            colors: _colors,
            textStyle: _textStyle
          ),
          ColorizeAnimatedText(
            'Deidara',
            colors: _colors,
            textStyle: _textStyle
          ),
        ],
      ),
    );
  }

  Widget _typerAnimatedText() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'PublicSansRegular'
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText('Os velhos acreditam em tudo,'),
          TyperAnimatedText('as pessoas de meia idade suspeitam de tudo,'),
          TyperAnimatedText('os jovens sabem tudo.')
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  Widget _textLiquidFill() {
    return TextLiquidFill(
      text: 'LIQUIDY',
      textStyle: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: Colors.red,
        fontFamily: 'PublicSansRegular'
      ), 

      waveColor: Colors.blueAccent,
      boxBackgroundColor: Colors.grey.shade400,
      
      boxHeight: 60.0,
    );
  }
  

  Widget _typewriterAnimatedText() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'ShipporiAntique'
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
          TypewriterAnimatedText('sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
          TypewriterAnimatedText('Ut enim ad minim veniam, quis nostrud exercitation ullamco'),
          TypewriterAnimatedText('laboris nisi ut aliquip ex ea commodo consequat.')
        ],
      ),
    );
  }
  

  Widget _scaleAnimatedText() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'YujiMaiRegular'
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          ScaleAnimatedText('Algoritmo'),
          ScaleAnimatedText('Codar'),
          ScaleAnimatedText('Debugar'),
          ScaleAnimatedText('Funfou?')
        ],
      ),
    );
  }

  Widget _wavyAnimatedText() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'PublicSansRegular'
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Obito Uchiha'),
          WavyAnimatedText('Kaguya Ōtsutsuki'),
          WavyAnimatedText('Kabuto Yakushi')
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  Widget _flickerAnimatedText() {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: GlobalsStyles().sizeTitulo,
        color: GlobalsStyles().textColorForte,
        fontFamily: 'PublicSansRegular',
      shadows: [
        Shadow(
          blurRadius: 7.0,
          color: Colors.white,
          offset: Offset(0, 0),
        ),
      ],
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          FlickerAnimatedText('Obito Uchiha'),
          FlickerAnimatedText('Kaguya Ōtsutsuki'),
          FlickerAnimatedText('Kabuto Yakushi')
        ],
        isRepeatingAnimation: true,
      ),
    );
  }
  

}