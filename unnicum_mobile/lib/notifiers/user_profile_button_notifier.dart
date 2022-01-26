import 'package:flutter/material.dart';

class UserProfileButtonNotifier extends ChangeNotifier {
  bool isSelected1 = true;
  bool isSelected2 = false;

  set updateButton(id) {
    if (id == 1) {
      if (!isSelected1) {
        isSelected1 = true;
        isSelected2 = false;
      }
    } else if (id == 2) {
      if (!isSelected2) {
        isSelected1 = false;
        isSelected2 = true;
      }
    }
    notifyListeners();
  }
}
