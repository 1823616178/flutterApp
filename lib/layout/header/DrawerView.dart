import 'package:flutter/material.dart';

class LayoutDrawerView extends StatelessWidget {
  const LayoutDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blue,
        width: 300,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
                accountName: Text("data"), accountEmail: Text("data")),
            UserAccountsDrawerHeader(
                accountName: Text("data"), accountEmail: Text("data")),
            UserAccountsDrawerHeader(
                accountName: Text("data"), accountEmail: Text("data")),
            UserAccountsDrawerHeader(
                accountName: Text("data"), accountEmail: Text("data")),
          ],
        ));
  }
}
