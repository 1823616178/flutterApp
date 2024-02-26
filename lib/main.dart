import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/layout/home/index.dart';
import 'dart:io';

import 'package:test1/pages/Detail/detail.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

final routes = [];

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => RestartWidget(child: LayoutIndex()),
        "/detail": (context) => Detail()
      },
      onGenerateInitialRoutes: (settings) {
        print(settings);
        return [
          MaterialPageRoute(
              builder: (context) => RestartWidget(child: LayoutIndex()),
              settings: RouteSettings(name: "/")),
        ];
      },
    );
  }
}

class CardModel extends ChangeNotifier {}

class RestartWidget extends StatefulWidget {
  final Widget child;

  const RestartWidget({Key? key, required this.child}) : super(key: key);

  static restartApp(BuildContext context) {
    final _RestartWidgetState? state =
        context.findAncestorStateOfType<_RestartWidgetState>();
    state?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
