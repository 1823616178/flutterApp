import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../model/AppModel.dart';

class Detail extends StatefulWidget {
  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext ConsumerContext, AppModel value, Widget? child) {
        return Container(
          child: Text(
            "Two",
            textDirection: TextDirection.ltr,
          ),
        );
      },
    );
  }
}
