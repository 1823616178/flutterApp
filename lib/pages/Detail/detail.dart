import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:test1/api/home.dart';
import 'package:test1/layout/home/header/DrawerView.dart';
import 'package:test1/pages/Detail/compose/DetailArticle.dart';
import 'package:test1/pages/Detail/compose/detailDrawer.dart';

class Detail extends StatefulWidget {
  final String sourceId;

  final String identifier = "";
  final String volume = "";

  const Detail({required this.sourceId, super.key});

  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  late Map contentObject = {};
  final _api = Api();

  @override
  void initState() {
    super.initState();
    getContent();
  }

  Future<void> getContent() async {
    final query = {
      "sourceId": widget.sourceId ?? '',
      "identifier": "06jh008390PZ00001",
      "volume": '001'
    };
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
