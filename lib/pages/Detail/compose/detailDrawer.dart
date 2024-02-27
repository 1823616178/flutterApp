import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../api/home.dart';

class DetailDraw extends StatefulWidget {
  @override
  _DetailDraw createState() => _DetailDraw();
}

class _DetailDraw extends State<DetailDraw> {
  final _api = Api();
  late List navList = [];

  Future<void> getNavList() async {
    Map<String, dynamic> body = {
      "sourceId": "06jh008390",
      "basicType": "图书",
      "volume": "001"
    };
    final result = await _api.selectBookPartListAndIsExist(body);
    setState(() {
      navList = result.containsKey('data') ? result['data'] : [];
    });
  }

  @override
  void initState() {
    super.initState();
    getNavList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      width: 200,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          itemCount: navList.length,
          itemBuilder: (BuildContext item, int index) {
            return Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(
                navList[index].containsKey('partName')
                    ? navList[index]['partName']
                    : "暂无",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 16),
              ),
            ));
          },
        ),
      ),
    );
  }
}
