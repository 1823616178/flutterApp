import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:test1/pages/Detail/detail.dart';

import '../../model/AppModel.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _home createState() => _home();
}

class _home extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      child: Text(
        "一",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 20),
      ),
      color: HexColor("#0099ff"),
      textColor: Colors.white,
      onPressed: () {
        Provider.of<AppModel>(context, listen: false).navbarIndex = 2;
      },
    );
  }
}
