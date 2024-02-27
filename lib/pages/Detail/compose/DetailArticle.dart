import 'package:flutter/cupertino.dart';

class DetailArticle extends StatefulWidget {
  final Map contentObj;

  DetailArticle({required this.contentObj, super.key});

  @override
  _DetailArticle createState() => _DetailArticle();
}

class _DetailArticle extends State<DetailArticle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(widget.contentObj.containsKey('content')
          ? widget.contentObj['content']
          : ''),
    );
  }
}
