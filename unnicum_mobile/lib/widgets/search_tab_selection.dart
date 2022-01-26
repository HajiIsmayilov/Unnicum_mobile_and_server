import 'package:unnicum_mobile/notifiers/search_tab_selection_notifier.dart';
import 'package:unnicum_mobile/widgets/search_tab_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTabSelection extends StatelessWidget {
  // final List<String> types = [
  //   'Art',
  //   'Fun',
  //   'Haci',
  //   'Isma',
  //   'Bashi216',
  //   'temp',
  //   'Hello',
  //   'Hakuna'
  // ];
  final List<String> types;
  final Function(String searchTab) onSearchTabChange;
  SearchTabSelection({
    required this.types,
    required this.onSearchTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final SearchTabSelectionNotifier selectionNotifier = new SearchTabSelectionNotifier(selectedTab: types[0]);
    selectionNotifier.addListener(() {
      onSearchTabChange(selectionNotifier.selectedTab);
    });
    final List<Widget> tabButtons = [];
    types.forEach((type) {
      tabButtons.add(
        ChangeNotifierProvider.value(
          value: selectionNotifier,
          child: SearchTabButton(type: type),
        ),
      );
    });
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.0233990147783251,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tabButtons,
        ),
      ),
    );
  }
}
