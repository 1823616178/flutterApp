import 'package:flutter/material.dart';

import 'AppBarViews.dart';
import 'DrawerView.dart';

class LayoutHeader extends StatefulWidget {
  const LayoutHeader({super.key});

  @override
  _LayoutHeader createState() => _LayoutHeader();
}

class _LayoutHeader extends State<LayoutHeader> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: LayoutDrawerView(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarViewsLayout(),
        ));
  }
}
