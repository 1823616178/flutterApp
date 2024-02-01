import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:test1/pages/Home/Home.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPage createState() => _ContainerPage();
}

class _Item {
  String name, activeIcon;

  _Item(this.name, this.activeIcon);
}

class _ContainerPage extends State<ContainerPage> {
  bool tickState = true;

  final itemNames = [
    _Item("首页", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MaterialButton(
            onPressed: () => {},
            child: Text("er"),
          ),
          MaterialButton(
            onPressed: () => {},
            child: Text("sab"),
          ),
          MaterialButton(
            onPressed: () => {},
            child: Text("sd"),
          ),
          MaterialButton(
            onPressed: () => {},
            child: Text("fafa"),
          ),
          MaterialButton(
            onPressed: () => {},
            child: Text("asdasd"),
          ),
        ],
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: [],
        onTap: (int index) => {print(index)},
      ),*/
    );
  }
}
