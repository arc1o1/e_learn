import 'package:flutter/material.dart';

class SchoolCategoryNotifier extends ChangeNotifier {
  String _selectedClass = "";
  String get selectedClass => _selectedClass;

  // select category functio
  void selectClass({required String classSelected}) {
    if (_selectedClass == classSelected) {
      _selectedClass = "";
      notifyListeners();
    } else {
      _selectedClass = classSelected;
      notifyListeners();
    }
  }
}
