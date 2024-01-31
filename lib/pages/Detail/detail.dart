import 'package:flutter/cupertino.dart';

import '../../layout/index.dart';

class Detail extends StatefulWidget {
  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: LayoutIndex(
      Text(
        "Two",
        textDirection: TextDirection.ltr,
      ),
    ));
  }
}
