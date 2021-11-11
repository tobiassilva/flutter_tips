import 'package:flutter/material.dart';

class NiceIntroCode extends StatefulWidget {
  const NiceIntroCode({ Key? key }) : super(key: key);

  @override
  _NiceIntroCodeState createState() => _NiceIntroCodeState();
}

class _NiceIntroCodeState extends State<NiceIntroCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.red,
    );
  }
}