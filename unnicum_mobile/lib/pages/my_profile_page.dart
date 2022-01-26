import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unnicum_mobile/enums/profile_mode.dart';
import 'package:unnicum_mobile/notifiers/user_profile_selection_notifier.dart';
import 'package:unnicum_mobile/pages/setting_page.dart';
import 'package:unnicum_mobile/routes/fade_route.dart';

class MyProfilePage extends StatelessWidget {
  final String username;
  final String location;
  final int age;
  final int views;
  final int judging;

  MyProfilePage({
    required this.username,
    required this.location,
    required this.age,
    required this.views,
    required this.judging,
  });

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
                    left: MediaQuery.of(context).size.width * 0.104,
                    right:
                        MediaQuery.of(context).size.width * 0.0426666666666667,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Text(
                        'My profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, FadeRoute(page: SettingPage()));
                        },
                        child: SvgPicture.asset(
                          "assets/icons/edit.svg",
                          height: MediaQuery.of(context).size.width * 0.055,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top:
                        MediaQuery.of(context).size.height * 0.0344827586206897,
                    left:
                        MediaQuery.of(context).size.width * 0.0426666666666667,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/avatar-placeholder.svg",
                        width: MediaQuery.of(context).size.width *
                            0.2033333333333333,
                        height: MediaQuery.of(context).size.height *
                            0.2033333333333333,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.048,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$username, $age',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$location',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    0.0258620689655172,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          '$views',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'views',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.0773333333333333,
                                    ),
                                    child: Text(
                                      '|',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.072,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          '$judging',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'judging',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<UserProfileSelectionNotifier>(
                  builder: (context, notifier, child) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.0369458128078818,
                        left: MediaQuery.of(context).size.width *
                            0.213333333333333,
                        right: MediaQuery.of(context).size.width *
                            0.213333333333333,
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
                                size: MediaQuery.of(context).size.width *
                                    0.0746666666666667,
                                color: notifier.profileMode == ProfileMode.first
                                    ? Colors.blue
                                    : Color.fromRGBO(139, 139, 139, 1),
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
                                size: MediaQuery.of(context).size.width *
                                    0.0746666666666667,
                                color:
                                    notifier.profileMode == ProfileMode.second
                                        ? Colors.blue
                                        : Color.fromRGBO(139, 139, 139, 1),
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
                    top:
                        MediaQuery.of(context).size.height * 0.0184729064039409,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: Color.fromRGBO(233, 233, 233, 1),
                  ),
                ),
                Expanded(
                  child: Consumer<UserProfileSelectionNotifier>(
                    builder: (context, notifier, child) =>
                        notifier.profileMode == ProfileMode.first
                            ? ListView.builder(
                                itemCount: notifier.getList().length,
                                itemBuilder: (context, index) =>
                                    notifier.getList()[index],
                              )
                            : new Padding(
                                padding: new EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.0426666666666667,
                                    right: MediaQuery.of(context).size.width *
                                        0.0426666666666667),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing:
                                        MediaQuery.of(context).size.width *
                                            0.0426666666666667,
                                    mainAxisSpacing:
                                        MediaQuery.of(context).size.height *
                                            0.0246305418719212,
                                  ),
                                  itemCount: notifier.getList().length,
                                  itemBuilder: (context, index) =>
                                      notifier.getList()[index],
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
