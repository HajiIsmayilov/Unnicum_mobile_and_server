import 'package:unnicum_mobile/notifiers/category_buttons_selection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryButtonsSelection extends StatelessWidget {
  final String content;
  bool isSelectable = false;
  CategoryButtonsSelection({
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryButtonsSelectionNotifier>(
      builder: (context, buttonSelectionNotifier, child) {
        return GestureDetector(
          onTap: () {
            isSelectable = !isSelectable;
            if (isSelectable) {
              if (buttonSelectionNotifier.selectButton()) {
                buttonSelectionNotifier.addSelectedButton(content);
                print('Selected');
              }
            } else {
              buttonSelectionNotifier.unSelectButton();
              buttonSelectionNotifier.removeSelectedButton(content);
              print('UnSelected');
            }
          },
          child: Container(
            alignment: Alignment.center,
            color: buttonSelectionNotifier.buttonsContains(content)
                ? Colors.blue
                : Color.fromRGBO(196, 196, 196, 1),
            height: MediaQuery.of(context).size.height * 0.0935960591133005,
            width: MediaQuery.of(context).size.width * 0.202666666666667,
            child: Text(
              content,
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
