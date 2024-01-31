import 'package:flutter/cupertino.dart';

class AppModel with ChangeNotifier {
  String title = "首页";

  void changeTitle(String str) {
    title = str;
    notifyListeners();
  }
}
