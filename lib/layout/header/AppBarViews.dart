import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

class AppBarViewsLayout extends StatefulWidget {
  const AppBarViewsLayout({super.key});

  @override
  State<AppBarViewsLayout> createState() => _AppBarViewsLayoutState();
}

class _AppBarViewsLayoutState extends State<AppBarViewsLayout> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => {Scaffold.of(context).openDrawer()},
          icon: const Icon(Icons.menu)),
      actions: [
        IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
      ],
      titleTextStyle: TextStyle(color: HexColor("#FFFFFF"), fontSize: 24),
      title: const Text("首页"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    );
  }
}
