import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:test1/api/home.dart';
import 'package:test1/layout/home/header/DrawerView.dart';
import 'package:test1/pages/Detail/compose/DetailArticle.dart';
import 'package:test1/pages/Detail/compose/detailDrawer.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  late Map contentObject = {};
  final _api = Api();

  Future<void> getContent() async {
    final query = {};
    final result = await _api.selectBookContentTextInfo(query);
    setState(() {
      contentObject = result.containsKey('data') ? result['data'] : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DetailDraw(),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        leading: Builder(
          builder: (BuildContext build) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => {Scaffold.of(build).openDrawer()},
            );
          },
        ),
        backgroundColor: HexColor("0099ff"),
      ),
      body: DetailArticle(
        contentObj: contentObject,
      ),
    );
  }
}
