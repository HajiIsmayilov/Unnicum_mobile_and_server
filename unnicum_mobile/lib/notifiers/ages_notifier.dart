import 'package:flutter/material.dart';

class AgeNotifier extends ChangeNotifier {
  int _currentAge = 0;

  final List<int> _ages = [0, 1, 2, 3, 4];

  int get currentAge => _currentAge;

  List<int> get ages => _ages;

  void setCurrentAge(int newAge) {
    _currentAge = newAge;

    notifyListeners();
  }
}
