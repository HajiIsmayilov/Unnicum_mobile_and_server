import 'package:flutter/material.dart';

class VotingNotifier extends ChangeNotifier {
  int count1 = 0;
  int count2 = 0;

  double percentage = 0;

  bool isSelected1 = false;
  bool isSelected2 = false;

  void readyPercentage() {
    percentage = (count1 * 100 / (count1 + count2)) / 100;
    notifyListeners();
  }

  void updateButton(int id) {
    if (id == 1) {
      if (isSelected2) {
        isSelected2 = false;
        count2--;
      }

      if (isSelected1) {
        isSelected1 = false;
        count1--;
      } else {
        isSelected1 = true;
        count1++;
      }
    } else if (id == 2) {
      if (isSelected1) {
        isSelected1 = false;
        count1--;
      }

      if (isSelected2) {
        isSelected2 = false;
        count2--;
      } else {
        isSelected2 = true;
        count2++;
      }
    }
    print('count1: $count1');
    print('count2: $count2');
    notifyListeners();
  }
}
