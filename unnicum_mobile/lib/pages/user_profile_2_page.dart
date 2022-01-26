import 'package:unnicum_mobile/enums/profile_mode.dart';
import 'package:unnicum_mobile/notifiers/user_profile_selection_notifier.dart';
import 'package:unnicum_mobile/widgets/user_profile_info_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notifier = UserProfileSelectionNotifier();

    return Scaffold(
      body: ChangeNotifierProvider<UserProfileSelectionNotifier>(
        create: (context) => notifier,
        builder: (context, child) => SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0689655172413793,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.0256266666666667,
                    right: MediaQuery.of(context).size.width * 0.06312,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      Expanded(child: Container()),
                      Text(
                        'User profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                UserProfileInfoHeader(
                  username: 'username',
                  location: 'location',
                  age: 21,
                  views: 1234,
                  judging: 1234,
                  points: 1234,
                ),
                Consumer<UserProfileSelectionNotifier>(
                  builder: (context, notifier, child) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.0369458128078818,
                        left: MediaQuery.of(context).size.width * 0.213333333333333,
                        right: MediaQuery.of(context).size.width * 0.213333333333333,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              notifier.updateMode = ProfileMode.first;
                            },
                            child: Container(
                              child: Icon(
                                Icons.circle,
                                size: MediaQuery.of(context).size.width * 0.0746666666666667,
                                color: notifier.profileMode == ProfileMode.first ? Colors.blue : Color.fromRGBO(139, 139, 139, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: () {
                              notifier.updateMode = ProfileMode.second;
                            },
                            child: Container(
                              child: Icon(
                                Icons.circle,
                                size: MediaQuery.of(context).size.width * 0.0746666666666667,
                                color: notifier.profileMode == ProfileMode.second ? Colors.blue : Color.fromRGBO(139, 139, 139, 1),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0184729064039409,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: Color.fromRGBO(233, 233, 233, 1),
                  ),
                ),
                Expanded(
                  child: Consumer<UserProfileSelectionNotifier>(
                    builder: (context, notifier, child) => notifier.profileMode == ProfileMode.first
                        ? ListView.builder(
                            itemCount: notifier.getList().length,
                            itemBuilder: (context, index) => notifier.getList()[index],
                          )
                        : new Padding(
                            padding: new EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.0426666666666667, right: MediaQuery.of(context).size.width * 0.0426666666666667),
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: MediaQuery.of(context).size.width * 0.0426666666666667,
                                mainAxisSpacing: MediaQuery.of(context).size.height * 0.0246305418719212,
                              ),
                              itemCount: notifier.getList().length,
                              itemBuilder: (context, index) => notifier.getList()[index],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
