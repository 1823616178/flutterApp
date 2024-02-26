import 'package:flutter/material.dart';
import 'package:test1/pages/Detail/detail.dart';
import 'package:test1/pages/Home/Home.dart';

//配置路由规则
final routes = {
  '/': (context) => Home(),
  '/page1': (context) => Detail(),
};

// 如果你要把路由抽离出去，需要写下面这一堆的代码
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
};
