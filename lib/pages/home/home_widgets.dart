import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/globals/globals_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/packages/home_packages_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeWidgets {
  BuildContext context;
  HomeWidgets(this.context);

  Widget homeWidgetsPrincipal(){
    return ListView(
      children: [
        //_capa(),
        const SizedBox(height: 25,),
        _opcoesWidget()
      ],
    );
  }

  Widget _capa(){
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15)),
        child: Image.asset(
          'assets/images/geral/capa_learning.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _opcoesWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalsWidgets().subtituloComBarra('Categorias', GlobalsStyles().sizeSubtitulo),

          SizedBox(height: 20,),
          _categoriasWidget(),

        ],
      ),
    );
  }

  Widget _categoriasWidget(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardCategoria(FontAwesomeIcons.plus, 'Packages', HomePackagesPage()),
          SizedBox(height: 20,),
          _cardCategoria(FontAwesomeIcons.codepen, 'Widgets', null),
          SizedBox(height: 20,),
          _cardCategoria(FontAwesomeIcons.mobileAlt, 'Apps', null),
          SizedBox(height: 20,),
          _cardCategoria(FontAwesomeIcons.usersCog, 'UI/UX', null),
        ],
      ),
    );
  }

  Widget _cardCategoria(_icon, _name, _rota){
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  GlobalsWidgets().sombreadoBoxShadow()
                ],
                color: GlobalsStyles().cardsColor,
                borderRadius: const BorderRadius.all(
                     Radius.circular(7)
                ),
            ),
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(0),),
              onPressed: (){
                if(_rota != null){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => _rota)
                );}
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: _rota != null ? GlobalsStyles().primaryColor : GlobalsStyles().textColorFraco,

                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(7)
                        )
                      ),
                      child: Icon(
                        _icon,
                        color: GlobalsStyles().textColorSecundary,
                        size: GlobalsStyles().sizeSubtitulo,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Text(
                        _name,
                        style: TextStyle(
                          fontSize: GlobalsStyles().sizeSubtitulo,
                          color: _rota != null ? GlobalsStyles().textColorForte : GlobalsStyles().textColorFraco,
                        ),
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      color: _rota != null ? GlobalsStyles().textColorForte : GlobalsStyles().textColorFraco,
                      size: GlobalsStyles().sizeSubtitulo,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}