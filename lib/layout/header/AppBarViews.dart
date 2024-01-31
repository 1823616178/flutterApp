import 'package:flutter/material.dart';

class AppBarViewsLayout extends StatelessWidget {
  const AppBarViewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => {Scaffold.of(context).openDrawer()},
          icon: const Icon(Icons.menu)),
      actions: [
        IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
      ],
      titleTextStyle: const TextStyle(color: Colors.amber, fontSize: 50),
      title: const Text("12312"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    );
  }
}
