import 'package:flutter/material.dart';

class CategoryNotifier extends ChangeNotifier {
  // int _currentAge = 0;

  // List<int> _ages = [0, 1, 2, 3, 4];

  // int get currentAge => _currentAge;

  // List<int> get ages => _ages;

  // void setCurrentAge(int newAge) {
  //   _currentAge = newAge;

  //   notifyListeners();
  // }

  String _currentCategory = 'nope';

  final List<String> _categories = [
    'nope',
    'Art',
    'Computer science',
    'Movies',
  ];

  String get currentCategory => _currentCategory;

  List<String> get categories => _categories;

  void setCurrentCategory(String newCategory) {
    _currentCategory = newCategory;

    notifyListeners();
  }
}
