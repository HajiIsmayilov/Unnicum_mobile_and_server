import 'package:unnicum_mobile/notifiers/search_tab_selection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTabButton extends StatelessWidget {
  final String type;

  SearchTabButton({
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchTabSelectionNotifier>(
      builder: (context, info, _) {
        return new GestureDetector(
          onTap: () {
            if (info.selectedTab != this.type) {
              info.updateSelectedTab = this.type;
            }
          },
          child: new Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: new BoxDecoration(
              color: Colors.transparent,
            ),
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new Padding(
                    padding: new EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.042,
                      right: MediaQuery.of(context).size.width * 0.042,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: new Text(
                        type,
                        style: new TextStyle(
                          color: info.selectedTab == this.type ? Colors.black : Colors.black54,
                          fontFamily: "SF Pro Medium",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    height: MediaQuery.of(context).size.height * 0.017,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(
                          color: info.selectedTab == this.type ? Colors.blue : Colors.lightBlue,
                          width: info.selectedTab == this.type ? 2 : 0.3,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
