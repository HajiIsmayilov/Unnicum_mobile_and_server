import 'package:unnicum_mobile/notifiers/search_tiles_notifier.dart';
import 'package:unnicum_mobile/widgets/search_tab_selection.dart';
import 'package:unnicum_mobile/widgets/searchbox.dart';
import 'package:unnicum_mobile/widgets/sub_category_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCategoryPage extends StatelessWidget {
  final List<String> types = [
    'Style',
    'Food',
    'Art',
    'Science & Tech',
    'TV & MoviesArt',
  ];

  @override
  Widget build(BuildContext context) {
    var notifier = SearchTileNotofier();
    return Scaffold(
      body: ChangeNotifierProvider<SearchTileNotofier>(
        create: (context) => notifier,
        builder: (context, child) {
          return Container(
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
                    builder: (context, notifier, _) => ListView.builder(
                      itemCount: notifier.getList().length,
                      itemBuilder: (context, index) => SubCategoryTile(
                        subCategory: notifier.getList()[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
