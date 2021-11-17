import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/globals/globals_widgets.dart';
import 'package:flutter_tips/pages/packages/globals_packages.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tips/pages/packages/view_package/view_package_page.dart';

import 'package:expandable/expandable.dart';

class HomePackagesWidgets {
  BuildContext context;
  HomePackagesWidgets(this.context);

  final globalsPackages = GlobalsPackages();

  /*List listPackages = [
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
  ];*/

  Widget homePackagesWidgetsPrincipal() {
    return ListView(
      shrinkWrap: true,
      children: [
        GlobalsWidgets().appBar(context, "Packages"),
        const SizedBox(
          height: 5,
        ),
        _listaOpcoesWidget()
      ],
    );
  }

  Widget _listaOpcoesWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GlobalsWidgets().subtituloComBarra(
              'Escolha uma Opção', GlobalsStyles().sizeSubtitulo),
          SizedBox(
            height: 20,
          ),
          //_listaPackages(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: globalsPackages.categoriasPackages.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child:
                    _listaPackages(globalsPackages.categoriasPackages[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _listaPackages(_jsonPackages) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: true,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [GlobalsWidgets().sombreadoBoxShadow()],
            color: GlobalsStyles().cardsColor,
            borderRadius: const BorderRadius.all(Radius.circular(7)),
          ),
          child: ExpandablePanel(
            header: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  _jsonPackages['nome'],
                  style: TextStyle(
                      color: GlobalsStyles().textColorForte,
                      fontSize: GlobalsStyles().sizeTextMedio),
                )),
            collapsed: Container(),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var _opcaoAtual in _jsonPackages['opcoes'])
                  Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ViewPackagePage(_opcaoAtual)));
                        },
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.check,
                              color: GlobalsStyles().primaryColor,
                              size: GlobalsStyles().sizeText,
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Text(
                                "${_opcaoAtual['infos'].nome}",
                                style: TextStyle(
                                    color: GlobalsStyles().textColorForte,
                                    fontSize: GlobalsStyles().sizeText),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      )),
              ],
            ),
            /*builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },*/
          ),
        ),
      ),
    );
  }

  Widget _cardPackagesOpcao(_jsonPackage) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [GlobalsWidgets().sombreadoBoxShadow()],
              color: GlobalsStyles().cardsColor,
              borderRadius: const BorderRadius.all(Radius.circular(7)),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(0),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewPackagePage(_jsonPackage)));
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
