import 'package:flutter/material.dart';

class SearchTabSelectionNotifier extends ChangeNotifier {
  String selectedTab;

  SearchTabSelectionNotifier({
    required this.selectedTab,
  });

  set updateSelectedTab(String tab) {
    selectedTab = tab;
    notifyListeners();
  }
}
