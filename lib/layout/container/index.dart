import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/pages/Detail/detail.dart';

class LayoutContainer extends StatefulWidget {
  @override
  _LayoutContainer createState() => _LayoutContainer();
}

class _LayoutContainer extends State<LayoutContainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateInitialRoutes: (settings) {
        return [
          MaterialPageRoute(
              builder: (context) => Detail(),
              settings: RouteSettings(name: "/detail"))
        ];
      },
    );
  }
}
