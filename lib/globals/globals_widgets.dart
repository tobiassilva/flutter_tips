import 'package:flutter/material.dart';

import 'globals_vars.dart';

class GlobalsWidgets {

  Widget appBar(_context, _titulo, ) {
    return Theme(
      data: ThemeData(fontFamily: GlobalsStyles().fontePrincipal),
      child: Material(
        color: GlobalsStyles().secundaryColor,
        elevation: 0,
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(_context);
              }, 
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: GlobalsStyles().sizeSubtitulo,
                color: GlobalsStyles().textColorForte
              ),
            ),
            SizedBox(width: 15,),
            Text(
              _titulo,
              style: TextStyle(
                fontSize: GlobalsStyles().sizeSubtitulo,
                color: GlobalsStyles().textColorForte
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget subtituloComBarra(_texto, _sizeText){
    return Row(
      children: [
        Container(
          height: _sizeText*2,
          width: 5,
          color: GlobalsStyles().primaryColor,
        ),
        SizedBox(width: 8,),
        Text(
          _texto,
          style: TextStyle(
            fontSize: _sizeText,
            color: GlobalsStyles().textColorForte,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

  sombreadoBoxShadow(){
    return BoxShadow(
      color: GlobalsStyles().sombreado,
      blurRadius: 5.0, // has the effect of softening the shadow
      spreadRadius: 0.2, // has the effect of extending the shadow
      offset: Offset(
        2.0, // horizontal, move right 10
        2.0, // vertical, move down 10
      ),
    );
  }

  sombreadoCorBoxShadow(_cor){
    return BoxShadow(
      color: _cor,
      blurRadius: 5.0, // has the effect of softening the shadow
      spreadRadius: 0.2, // has the effect of extending the shadow
      offset: Offset(
        2.0, // horizontal, move right 10
        2.0, // vertical, move down 10
      ),
    );
  }
}