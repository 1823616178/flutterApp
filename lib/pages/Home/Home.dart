import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:test1/api/home.dart';
import 'package:test1/pages/Detail/detail.dart';

import '../../model/AppModel.dart';

final _api = Api();

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _home createState() => _home();
}

class _home extends State<Home> {
  void getList() {}

  @override
  void initState() {
    super.initState();
    _api.advancedRetrievalParams({
      "advancedRetrievalParams": Uri.encodeComponent(jsonEncode([
        {
          "relation": "should",
          "field": "title",
          "keyword": "安",
          "match": "fuzzy"
        },
        {
          "relation": "should",
          "field": "author",
          "keyword": "安",
          "match": "fuzzy"
        },
        {
          "relation": "should",
          "field": "topicWord",
          "keyword": "安",
          "match": "fuzzy"
        },
        {
          "relation": "should",
          "field": "description",
          "keyword": "安",
          "match": "fuzzy"
        }
      ])),
      "sourceType": '',
      "categoryType": ''
    }, (result) => print(result.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
