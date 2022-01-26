import 'package:flutter/material.dart';

class SplashNotifier extends ChangeNotifier {
  CrossFadeState _splashAuthState = CrossFadeState.showFirst;
  set updateSplashAuthState(CrossFadeState state) {
    _splashAuthState = state;
    notifyListeners();
  }

  CrossFadeState get splashAuthState => _splashAuthState;
}
