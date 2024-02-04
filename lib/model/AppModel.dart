import 'package:flutter/cupertino.dart';

class AppModel with ChangeNotifier {
  String title = "首页";
  int _navbarIndex = 0;
  int _drawIndex = 0;

  int get navbarIndex => _navbarIndex;

  int get drawIndex => _drawIndex;

  set drawIndex(int val) {
    _drawIndex = val;
    notifyListeners();
  }

  set navbarIndex(int value) {
    _navbarIndex = value;
    notifyListeners();
  }

  void changeTitle(String str) {
    title = str;
    notifyListeners();
  }
}
