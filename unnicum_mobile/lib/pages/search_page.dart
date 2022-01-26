import 'package:unnicum_mobile/notifiers/search_tiles_notifier.dart';
import 'package:unnicum_mobile/widgets/search_tab_selection.dart';
import 'package:unnicum_mobile/widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final List<String> types = [
    '  Popular  ',
    '  New  ',
    '  Duels  ',
    '  Users  ',
  ];

  @override
  Widget build(BuildContext context) {
    var notifier = SearchTileNotofier();
    return Scaffold(
      body: ChangeNotifierProvider<SearchTileNotofier>(
        create: (context) => notifier,
        builder: (context, child) {
          return SafeArea(
            child: Container(
              child: Column(
                children: [
                  SearchBox(),
                  SearchTabSelection(
                    types: types,
                    onSearchTabChange: (searchTab) {
                      notifier.searchTile = searchTab;
                      print(searchTab);
                    },
                  ),
                  Expanded(
                    child: Consumer<SearchTileNotofier>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: notifier.getListw().length,
                          itemBuilder: (context, index) => notifier.getListw()[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
