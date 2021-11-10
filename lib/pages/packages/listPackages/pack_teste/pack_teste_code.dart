import 'package:flutter/material.dart';

class PackTeste extends StatefulWidget {
  const PackTeste({ Key? key }) : super(key: key);

  @override
  _PackTesteState createState() => _PackTesteState();
}

class _PackTesteState extends State<PackTeste> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        color: Colors.red,
      ),
    );
  }
}