import 'package:flutter/material.dart';

class AddVideoButtonNotifier extends ChangeNotifier {
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  void updateButton() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}
