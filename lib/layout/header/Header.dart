import 'package:flutter/material.dart';
import 'AppBarViews.dart';
import 'DrawerView.dart';

class LayoutHeader extends StatefulWidget {
  final Widget body;

  LayoutHeader(this.body, {super.key});

  @override
  _LayoutHeader createState() => _LayoutHeader();
}

class _LayoutHeader extends State<LayoutHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LayoutDrawerView(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarViewsLayout(),
      ),
      body: widget.body,
    );
  }
}
