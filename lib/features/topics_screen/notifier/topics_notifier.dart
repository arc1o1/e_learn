import 'package:flutter/material.dart';

class TopicsNotifier extends ChangeNotifier {
  String _selectedWeek = "";
  String get selectedWeek => _selectedWeek;

  // select category functio
  void selectWeek({required String weekSelected}) {
    if (_selectedWeek == weekSelected) {
      _selectedWeek = "";
      notifyListeners();
    } else {
      _selectedWeek = weekSelected;
      notifyListeners();
    }
  }
}
