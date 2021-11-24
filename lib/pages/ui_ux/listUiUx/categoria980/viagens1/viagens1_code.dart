import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tips/globals/globals_vars.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Viajens1Code extends StatefulWidget {
  const Viajens1Code({Key? key}) : super(key: key);

  @override
  _Viajens1CodeState createState() => _Viajens1CodeState();
}

class _Viajens1CodeState extends State<Viajens1Code> {
  final _controlletText = TextEditingController();

  final List _locaisViajem = [
    {
      "name": "Índia, Himalaia",
      "stars": 4.0,
      "time": "04:55",
      "review": 4.1,
      "price": 599,
      "description":
          "Os Himalaias são a mais alta cadeia montanhosa do mundo, abrangendo cinco países: Paquistão, Índia, China (que inclui o Tibete), Nepal e Butão, – e é e nela que se situa a montanha mais alta do planeta, o Monte Everest.",
      "image": "assets/images/ui_ux/mountains.jpg"
    },
    {
      "name": "Brazil, Pão de Açucar",
      "stars": 3.5,
      "time": "01:45",
      "review": 8.3,
      "price": 290,
      "description":
          "Monumento Natural dos Morros do Pão de Açúcar e da Urca é um complexo de morros localizado no bairro da Urca, na cidade do Rio de Janeiro, no Brasil.",
      "image": "assets/images/ui_ux/paodeacucar.jpg"
    },
    {
      "name": "Suíça, Fälensee",
      "stars": 3.0,
      "time": "03:30",
      "review": 5.8,
      "price": 399,
      "description":
          "O Fälensee é um lago incrível na regiao de Appenzel, relativamente perto do Seealpsee, de uma coloração mais escura mas que impressiona pelos reflexos dos Alpes na água.",
      "image": "assets/images/ui_ux/boat.jpg"
    },
    {
      "name": "Suíça, Glacier Express",
      "stars": 5.0,
      "time": "04:55",
      "review": 13.2,
      "price": 489,
      "description":
          "Glacier Express percorre vales alpinos entre dois dos mais cobiçados vilarejos de montanha suíços: a democrática Zermatt e a metidíssima St. Moritz.",
      "image": "assets/images/ui_ux/train-ice.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PublicSansRegular'),
      home: Scaffold(
        backgroundColor: GlobalsStyles().secundaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              //Topo - AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.menu,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage('assets/images/auxiliares/profile1.jpg'),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              //Campo Texto Busca
              Text(
                'Find Your Travel',
                style: TextStyle(
                    color: GlobalsStyles().textColorForte,
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsStyles().sizeSubtitulo),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Destination',
                  hintStyle: TextStyle(
                    fontSize: 13,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: GlobalsStyles().textColorForte,
                  ),
                ),
                controller: _controlletText,
              ),

              // Lista Viajens
              Container(
                child: _listaViajem(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listaViajem() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: _locaisViajem.length,
      shrinkWrap: true,
      itemBuilder: (_, _index) {
        return Column(
          children: [
            SizedBox(
              height: 45,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Viajens1CodeDetalhes(_locaisViajem[_index], _index)));
              },
              child: Container(
                height: MediaQuery.of(context).size.width / 2.5,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Row(
                        children: [
                          Text(
                            "${_locaisViajem[_index]['time']}",
                            style: TextStyle(
                              color: GlobalsStyles().textColorFraco,
                              fontSize: GlobalsStyles().sizeText,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.airplanemode_active,
                            color: GlobalsStyles().textColorFraco,
                            size: GlobalsStyles().sizeTitulo,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(300),
                              ),
                              child: Hero(
                                tag: 'imgCapa$_index',
                                child: Image.asset(
                                  '${_locaisViajem[_index]['image']}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 50, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "${_locaisViajem[_index]['name']}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SmoothStarRating(
                                allowHalfRating: false,
                                isReadOnly: true,
                                size: 20,
                                rating: _locaisViajem[_index]['stars'],
                                color: Colors.yellow,
                                borderColor: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '(${_locaisViajem[_index]['review']}k review)',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Viajens1CodeDetalhes extends StatelessWidget {
  var _locaisViajemEsc;
  int _index;
  Viajens1CodeDetalhes(this._locaisViajemEsc, this._index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // imagem fundo
              Container(
                height: MediaQuery.of(context).size.height,
                child: Hero(
                  tag: "imgCapa$_index",
                  child: Image.asset(
                    '${_locaisViajemEsc['image']}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //infos
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              'assets/images/auxiliares/profile1.jpg'),
                        ),
                      ],
                    ),

                    //detalhes
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "${_locaisViajemEsc['name']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SmoothStarRating(
                              allowHalfRating: false,
                              isReadOnly: true,
                              size: 20,
                              rating: _locaisViajemEsc['stars'],
                              color: Colors.yellow,
                              borderColor: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '(${_locaisViajemEsc['review']}k review)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.bed,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.wifi,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.mountain,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        //descrição
                        Text(
                          '${_locaisViajemEsc['description']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Text(
                                      '\$ ${_locaisViajemEsc['price']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bock now',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
