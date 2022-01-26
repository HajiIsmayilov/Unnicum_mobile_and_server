import 'package:flutter/material.dart';

class TNotifier extends ChangeNotifier {
  String selectedId = "";

  void select(String id) {
    selectedId = id;
    notifyListeners();
  }

  bool checkId(String id) => id == selectedId ? true : false;
}
