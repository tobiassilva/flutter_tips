import 'package:flutter/material.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:flutter_tips/globals/globals_widgets.dart';
import 'package:flutter_tips/pages/packages/view_package/view_package_functions.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:dart_code_viewer/dart_code_viewer.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class ViewPackagesWidgets {
  BuildContext context;
  ViewPackagesWidgets(this.context);

  Widget codePackagesWidgets(String _caminhoCodigo) {
    return SourceCodeView(
      filePath: _caminhoCodigo,
      codeLinkPrefix: Variaveis().linkBaseGithub,
    );
  }

  Widget viewPackagesWidgets(_codigoPack) {
    return _codigoPack;
  }

  Widget infosPackagesWidgets(_jsonInfos) {
    final _viewPackageFunctions = Provider.of<ViewPackageFunctions>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          GlobalsWidgets()
              .subtituloComBarra(_jsonInfos.nome, GlobalsStyles().sizeTitulo),
          _jsonInfos.versaoPackage != ''
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Versão Utilizada: ",
                          style: TextStyle(
                            color: GlobalsStyles().textColorMedio,
                            fontSize: GlobalsStyles().sizeTextMedio,
                          ),
                        ),
                        Text(
                          "${_jsonInfos.versaoPackage}",
                          style: TextStyle(
                            color: GlobalsStyles().textColorForte,
                            fontSize: GlobalsStyles().sizeTextMedio,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          _viewPackageFunctions.categoriaPackage != ''
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Categoria: ",
                          style: TextStyle(
                            color: GlobalsStyles().textColorMedio,
                            fontSize: GlobalsStyles().sizeTextMedio,
                          ),
                        ),
                        Text(
                          "${_viewPackageFunctions.categoriaPackage}",
                          style: TextStyle(
                            color: GlobalsStyles().textColorForte,
                            fontSize: GlobalsStyles().sizeTextMedio,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          _jsonInfos.observacoes != ''
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Observações:",
                      style: TextStyle(
                        color: GlobalsStyles().textColorMedio,
                        fontSize: GlobalsStyles().sizeTextMedio,
                      ),
                    ),
                    Text(
                      "   ${_jsonInfos.observacoes}",
                      style: TextStyle(
                        color: GlobalsStyles().textColorForte,
                        fontSize: GlobalsStyles().sizeTextMedio,
                      ),
                    ),
                  ],
                )
              : Container(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _jsonInfos.linkPackage != ''
                    ? _botaoPack('assets/images/geral/dart_icon.png', "Pub.dev",
                        Color.fromRGBO(28, 40, 52, 1), _jsonInfos.linkPackage)
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                _jsonInfos.caminhoCodigo != ''
                    ? _botaoPack(
                        'assets/images/geral/github_icon.png',
                        "GitHub",
                        Colors.black,
                        "${Variaveis().linkBaseGithub}${_jsonInfos.caminhoCodigo}")
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                _jsonInfos.linkYoutube != ''
                    ? _botaoPack('assets/images/geral/yt_icon.png', "Youtube",
                        Colors.red, _jsonInfos.linkYoutube)
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoPack(_img, _nome, _corFundo, _link) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          boxShadow: [
            GlobalsWidgets().sombreadoBoxShadow(),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(4),
          ),
          color: _corFundo),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        onPressed: () async {
          if (await canLaunch('$_link')) {
            await launch('$_link');
          } else {
            throw 'Página não encontrada';
          }
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: Row(
            children: [
              Container(
                height: 45 - 16,
                width: 45 - 16,
                child: Image.asset(
                  _img,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 20),
              Text(
                _nome,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: GlobalsStyles().sizeSubtitulo,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
