import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/globals/globals_widgets.dart';

import 'package:flutter_tips/pages/packages/listPackages/categoria42/nice_intro/nice_intro_code.dart';
import 'package:flutter_tips/pages/packages/listPackages/categoria42/nice_intro/nice_intro_infos.dart';
import 'listPackages/categoria80/liquid_swipe/liquid_swipe_code.dart';
import 'listPackages/categoria80/liquid_swipe/liquid_swipe_infos.dart';
import 'package:flutter_tips/pages/packages/view_package/view_package_page.dart';


class HomePackagesWidgets {
  BuildContext context;
  HomePackagesWidgets(this.context);

  List listPackages = [
    {
      "codigo": LiquidSwipeCode(),
      "infos": LiquidSwipeInfos(),
      "idCategoria": 80,
    },
    {
      "codigo": NiceIntroCode(),
      "infos": NiceIntroInfos(),
      "idCategoria": 42,
    },
    
  ]; 

  Widget homePackagesWidgetsPrincipal(){
    return ListView(
      shrinkWrap: true,
      children: [
        GlobalsWidgets().appBar(context, "Packages"),
        const SizedBox(height: 5,),
        _listaOpcoesWidget()
      ],
    );
  }

  Widget _listaOpcoesWidget(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
      child: Column(
        children: [

          SizedBox(height: 20,),
          GlobalsWidgets().subtituloComBarra('Escolha uma Opção', GlobalsStyles().sizeSubtitulo),
          SizedBox(height: 20,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listPackages.length,
            itemBuilder: (_, index){
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: _cardPackagesOpcao(listPackages[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _cardPackagesOpcao(_jsonPackage){
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPackagePage(_jsonPackage))
                );
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _jsonPackage['infos'].nome,
                        style: TextStyle(
                          fontSize: GlobalsStyles().sizeSubtitulo,
                          color: GlobalsStyles().textColorForte,
                        ),
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      color: GlobalsStyles().textColorForte,
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