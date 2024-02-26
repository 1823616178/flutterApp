import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/AppModel.dart';


class LayoutDrawerView extends StatelessWidget {
  const LayoutDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AppModel>(context, listen: false).navbarIndex;

    return Drawer(
      backgroundColor: Colors.blue,
      width: 300,
      child: Consumer(
        builder: (BuildContext BuildContext, AppModel value, Widget? child) {
          if (value.navbarIndex == 1) {
            return ListView(
              padding: EdgeInsets.zero,
              children: const [
                Text(
                  "asdas",
                  textDirection: TextDirection.ltr,
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
