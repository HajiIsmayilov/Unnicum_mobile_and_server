import 'package:unnicum_mobile/notifiers/category_buttons_selection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_buttons_selection.dart';

class CategoryButtonsArea extends StatelessWidget {
  List<String> list = [
    'All',
    'Style',
    'Food',
    'Art',
    'Tech',
    'Media',
    'Sport',
    'Extreme',
    'Nature',
    'Architecture',
    'Human',
    'Funny',
    'Photo contest',
    'Judgement',
  ];

  @override
  Widget build(BuildContext context) {
    final CategoryButtonsSelectionNotifier notifier = CategoryButtonsSelectionNotifier();
    final List<Widget> buttons = [];
    for (var button in list) {
      buttons.add(
        ChangeNotifierProvider.value(
          value: notifier,
          child: CategoryButtonsSelection(
            content: button,
          ),
        ),
      );
    }
    print(buttons.length);
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.0184729064039409,
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: MediaQuery.of(context).size.height * 0.0233990147783251,
        spacing: MediaQuery.of(context).size.width * 0.0693333333333333,
        children: buttons,
      ),
    );
  }
}
