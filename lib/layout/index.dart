import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/model/AppModel.dart';
import 'header/Header.dart';

class LayoutIndex extends StatefulWidget {

  LayoutIndex({super.key});

  @override
  _StatefulWidget createState() => _StatefulWidget();
}

class _StatefulWidget extends State<LayoutIndex> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "AppFlutter",
        theme: ThemeData(backgroundColor: Colors.amber),
        home: ChangeNotifierProvider<AppModel>(
          create: (appContext) => AppModel(),
          child: LayoutHeader(),
        ),
    );
  }
}
