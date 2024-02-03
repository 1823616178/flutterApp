import 'package:flutter/cupertino.dart';

class Detail extends StatefulWidget {
  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Two",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
