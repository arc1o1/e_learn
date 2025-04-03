import 'package:flutter/material.dart';

class BottomNavigationNotifier with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void setIndexPage(int pageIndex) {
    _index = pageIndex;
    notifyListeners();
  }
}
