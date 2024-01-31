import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:test1/model/AppModel.dart';

class AppBarViewsLayout extends StatefulWidget {
  const AppBarViewsLayout({super.key});

  @override
  State<AppBarViewsLayout> createState() => _AppBarViewsLayoutState();
}

class _AppBarViewsLayoutState extends State<AppBarViewsLayout> {
  bool tagStatus = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (BuildContext context, AppModel value, Widget? child) {
        return AppBar(
          leading: IconButton(
              onPressed: () => {Scaffold.of(context).openDrawer()},
              icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
                onPressed: () => {
                      tagStatus = !tagStatus,
                      value.changeTitle(tagStatus ? "第二页" : "第一页")
                    },
                icon: const Icon(Icons.search))
          ],
          titleTextStyle: TextStyle(color: HexColor("#FFFFFF"), fontSize: 24),
          title: Text(value.title),
          backgroundColor: Colors.blue,
          centerTitle: true,
        );
      },
    );
  }
}
