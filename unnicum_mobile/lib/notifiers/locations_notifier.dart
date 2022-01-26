import 'package:flutter/material.dart';

class LocationNotifier extends ChangeNotifier {
  String currentLocation = 'nope';

  List<String> locations = ['nope', 'Baku', 'Ankara', 'Roma'];

  void setCurrentLocation(String newValue) {
    currentLocation = newValue;

    notifyListeners();
  }
}
