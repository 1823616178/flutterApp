import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/model/AppModel.dart';
import 'package:test1/pages/Detail/detail.dart';
import 'package:test1/pages/Home/Home.dart';
import 'package:test1/routes/Routes.dart';

import 'header/Header.dart';

class LayoutIndex extends StatefulWidget {
  LayoutIndex({super.key});

  @override
  _StatefulWidget createState() => _StatefulWidget();
}

class _StatefulWidget extends State<LayoutIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppModel>(
        create: (appContext) => AppModel(),
        child: LayoutHeader(),
      ),
    );
  }
}
