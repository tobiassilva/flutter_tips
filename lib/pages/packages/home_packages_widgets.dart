import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/globals/globals_widgets.dart';
import 'package:flutter_tips/pages/packages/listPackages/pack_teste/pack_teste_code.dart';
import 'package:flutter_tips/pages/packages/listPackages/pack_teste/pack_teste_infos.dart';
import 'package:flutter_tips/pages/packages/view_package/view_package_page.dart';

class HomePackagesWidgets {
  BuildContext context;
  HomePackagesWidgets(this.context);

  List listPackages = [
    {
      "codigo": PackTeste(),
      "infos": PackTestInfos()
    },
    {
      "codigo": PackTeste(),
      "infos": PackTestInfos()
    },
    
  ]; 

  Widget homePackagesWidgetsPrincipal(){
    return ListView(
      shrinkWrap: true,
      children: [
        /*_capa(),
        const SizedBox(height: 25,),*/
        _listaOpcoesWidget()
      ],
    );
  }

  Widget _listaOpcoesWidget(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
                child: _cardPackagesOpcao(/*FontAwesomeIcons.plus,*/ listPackages[index]),//listPackages[index].packageTesteCode(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _cardPackagesOpcao(/*_icon,*/ _jsonPackage){
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
                    /*Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: GlobalsStyles().primaryColor,

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
                    SizedBox(width: 10,),*/
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