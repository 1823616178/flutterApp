import 'package:flutter/material.dart';
import 'header/Header.dart';

class LayoutIndex extends StatefulWidget {
  const LayoutIndex({super.key});

  @override
  _StatefulWidget createState() => _StatefulWidget();
}


class _StatefulWidget extends State<LayoutIndex> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hello world",
        theme: ThemeData(backgroundColor: Colors.amber),
        home: LayoutHeader()
    );
  }
}
