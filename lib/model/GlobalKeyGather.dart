import 'package:flutter/cupertino.dart';

class GlobalKeyGather with ChangeNotifier {
  int count = 0;

  void add() {
    count++;
    notifyListeners();
  }
}
