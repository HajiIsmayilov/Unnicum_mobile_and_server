import 'package:flutter/material.dart';

class MainPageInfoNotifier extends ChangeNotifier {
  int tabIndex = 0;

  set updateTab(value) {
    tabIndex = value;
    notifyListeners();
  }
}
