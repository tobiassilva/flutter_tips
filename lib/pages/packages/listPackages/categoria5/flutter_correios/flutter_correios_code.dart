import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_correios/flutter_correios.dart';
import 'package:flutter_correios/model/objeto_rastreio.dart';
import 'package:flutter_correios/model/resultado_cep.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlutterCorreiosCode extends StatefulWidget {
  const FlutterCorreiosCode({Key? key}) : super(key: key);

  @override
  _FlutterCorreiosCodeState createState() => _FlutterCorreiosCodeState();
}

class _FlutterCorreiosCodeState extends State<FlutterCorreiosCode> {
  final FlutterCorreios _flutterCorreios = FlutterCorreios();
  final _correioController = TextEditingController();
  final _rastreioController = TextEditingController();

  bool _verDetalhesCep = false;

  late String _bairro;
  late String _cidade;
  late String _estado;
  late String _logradouro;
  late String _areaKm2Est;
  late String _codigoIBGEEst;
  late String _nomeEst;
  late String _areaKmCid;
  late String _codigoIBGECid;

  //rastreio Objeto
  bool _verDetalhesRas = false;
  bool _errorRas = false;

  var _codigo;
  var _servico;
  List _historico = [];

  @override
  void initState() {
    //_rastreioController.text = 'PT118988786BR';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/packages/correio_img.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: ListView(
                children: [
                  _consultaCep(),
                  SizedBox(
                    height: 15,
                  ),
                  _rastrearObjeto()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _consultaCep() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: GlobalsStyles().secundaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Consultar CEP:',
            style: TextStyle(
                color: GlobalsStyles().textColorForte,
                fontSize: GlobalsStyles().sizeSubtitulo),
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.city,
                    ),
                    hintText: 'Informe um CEP',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  controller: _correioController,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                  ),
                  onPressed: () async {
                    print(_correioController.text);
                    ResultadoCEP _res = await _flutterCorreios.consultarCEP(
                        cep: "${_correioController.text}");
                    _cidade = _res.cidade;
                    _bairro = _res.bairro;
                    _estado = _res.estado;
                    _logradouro = _res.logradouro;
                    _areaKm2Est = _res.estadoInfo.areaKm2;
                    _codigoIBGEEst = _res.estadoInfo.codigoIBGE;
                    _nomeEst = _res.estadoInfo.nome;
                    _areaKmCid = _res.cidadeInfo.areaKm2;
                    _codigoIBGECid = _res.cidadeInfo.codigoIBGE;
                    setState(() {
                      _verDetalhesCep = !_verDetalhesCep;
                    });
                  },
                  child: !_verDetalhesCep
                      ? Text(
                          'Ir!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          ),
          !_verDetalhesCep
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      height: 15,
                    ),
                    _campoDetalheCet("Logradouro:", _logradouro),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("Bairro:", _bairro),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("Cidade:", _cidade),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("", "$_areaKmCid Km2"),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("", "$_codigoIBGECid (IBGE)"),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("Estado:", "$_nomeEst - $_estado"),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("", "$_areaKm2Est Km2"),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("", "$_codigoIBGEEst (IBGE)"),
                    SizedBox(
                      height: 10,
                    ),
                    _campoDetalheCet("Cidade:", _cidade),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _campoDetalheCet(_titulo, _texto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titulo == ''
            ? Container()
            : Text(
                '$_titulo',
                style: TextStyle(
                    color: GlobalsStyles().textColorMedio,
                    fontSize: GlobalsStyles().sizeTextMedio),
              ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  '$_texto',
                  style: TextStyle(
                    color: GlobalsStyles().textColorForte,
                    fontSize: GlobalsStyles().sizeSubtitulo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rastrearObjeto() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: GlobalsStyles().secundaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rastrear Objeto:',
            style: TextStyle(
                color: GlobalsStyles().textColorForte,
                fontSize: GlobalsStyles().sizeSubtitulo),
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.city,
                    ),
                    hintText: 'PT118988786BR',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  controller: _rastreioController,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                  ),
                  onPressed: () async {
                    _historico.clear();
                    print(_rastreioController.text);
                    try {
                      ObjetoRastreio _resRastreio =
                          await _flutterCorreios.fazerRastreio(
                              codRastreio: "${_rastreioController.text}");

                      _codigo = _resRastreio.codigo;
                      _servico = _resRastreio.servico;
                      _historico.addAll(_resRastreio.historico);
                      _errorRas = false;
                    } catch (_err) {
                      _errorRas = true;
                    }
                    setState(() {
                      _verDetalhesRas = !_verDetalhesRas;
                    });
                  },
                  child: !_verDetalhesRas
                      ? Text(
                          'Ir!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          ),
          !_verDetalhesRas
              ? Container()
              : _errorRas
                  ? Text(
                      'Código Inválido',
                      style: TextStyle(
                          color: GlobalsStyles().textColorMedio,
                          fontSize: GlobalsStyles().sizeTextMedio),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          height: 15,
                        ),
                        _campoDetalheCet("Código Rastreio:", _codigo),
                        SizedBox(
                          height: 10,
                        ),
                        _campoDetalheCet("Servico:", _servico),
                        SizedBox(
                          height: 10,
                        ),
                        for (Historico _hist in _historico)
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _campoDetalheCet("Data:", _hist.data),
                                SizedBox(
                                  height: 10,
                                ),
                                _campoDetalheCet("Local:", _hist.local),
                                SizedBox(
                                  height: 10,
                                ),
                                _campoDetalheCet("Situação:", _hist.situacao),
                                SizedBox(
                                  height: 10,
                                ),
                                _campoDetalheCet("Detalhes:", _hist.detalhes),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
        ],
      ),
    );
  }
}
