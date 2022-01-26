import 'package:flutter/material.dart';

class CategoryButtonsSelectionNotifier extends ChangeNotifier {
  final List<String> _selectedButtons = [];

  List<String> get selectedButtons => _selectedButtons;

  bool selectButton() {
    if (_selectedButtons.length + 1 <= 3) {
      print(_selectedButtons.length);
      notifyListeners();
      return true;
    }
    return false;
  }

  void unSelectButton() {
    if (_selectedButtons.length - 1 > 0) {
      print(_selectedButtons.length);
      notifyListeners();
    }
  }

  void addSelectedButton(String value) {
    if (!buttonsContains(value)) {
      _selectedButtons.add(value);
      notifyListeners();
    }
  }

  bool buttonsContains(String data) {
    return _selectedButtons.contains(data);
  }

  void removeSelectedButton(String value) {
    _selectedButtons.remove(value);
    notifyListeners();
  }
}
