import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:test1/pages/Detail/detail.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _home createState() => _home();
}

class _home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text("一"),
      color: HexColor("#0099ff"),
      textColor: Colors.white,
      onPressed: () {
       
      },
    );
  }
}
