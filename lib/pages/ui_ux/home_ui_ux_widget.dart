import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/globals/globals_widgets.dart';
import 'package:flutter_tips/pages/ui_ux/globals_ui_ux.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tips/pages/packages/view_package/view_package_page.dart';

import 'package:expandable/expandable.dart';

import 'viewUiUx/view_uiux_page.dart';

class HomeUiUxWidgets {
  BuildContext context;
  HomeUiUxWidgets(this.context);

  final globalsUiUx = GlobalsUiUx();
  

  Widget homeUiUxWidgetsPrincipal() {
    return ListView(
      shrinkWrap: true,
      children: [
        GlobalsWidgets().appBar(context, "UI/UX"),
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
          //_lista(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: globalsUiUx.categorias.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child:
                    _lista(globalsUiUx.categorias[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _lista(_jsonOpcao) {
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
                  _jsonOpcao['nome'],
                  style: TextStyle(
                      color: GlobalsStyles().textColorForte,
                      fontSize: GlobalsStyles().sizeTextMedio),
                )),
            collapsed: Container(),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var _opcaoAtual in _jsonOpcao['opcoes'])
                  Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ViewUiUxPage(_opcaoAtual)));
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
