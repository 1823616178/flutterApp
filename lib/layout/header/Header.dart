import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:test1/model/AppModel.dart';
import 'package:test1/pages/Detail/detail.dart';
import 'package:test1/pages/Home/Home.dart';
import 'AppBarViews.dart';
import 'DrawerView.dart';

class LayoutHeader extends StatefulWidget {
  LayoutHeader({super.key});

  @override
  _LayoutHeader createState() => _LayoutHeader();
}

class _LayoutHeader extends State<LayoutHeader> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, Map<String, Widget>>> routerParams = [
      {
        "home": {"view": Home()}
      },
      {
        "detail": {"view": Detail()}
      }
    ];
    void changeNavbarIndex(int value) {
      setState(() {
        Provider.of<AppModel>(context, listen: false).navbarIndex = value;
      });
    }

    return Scaffold(
      drawer: LayoutDrawerView(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarViewsLayout(),
      ),
      body: Consumer<AppModel>(
        builder: (BuildContext context, AppModel value, Widget? child) {
          return value.navbarIndex == 1 ? Home() : Detail();
        },
      ),
      bottomNavigationBar: Consumer<AppModel>(
        builder: (BuildContext context, AppModel appModel, Widget? child) {
          return BottomNavigationBar(
            currentIndex: appModel.navbarIndex,
            onTap: (int index) => {changeNavbarIndex(index)},
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  tooltip: "这是什么？",
                  label: "home",
                  backgroundColor: HexColor("#0099ff")),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.details), label: "detail"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.school), label: "list"),
            ],
          );
        },
      ),
    );
  }
}
