import 'dart:io';

import 'package:unnicum_mobile/notifiers/t_notofier.dart';
import 'package:unnicum_mobile/utilities/glow/noglow.dart';
import 'package:unnicum_mobile/widgets/custom_button.dart';
import 'package:unnicum_mobile/widgets/with_existing_subcategory_add_video_step_3_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

class WithExistingSubCategoryAddVideoStep3PageArgs {
  final File file;
  final Image image;

  WithExistingSubCategoryAddVideoStep3PageArgs(this.file, this.image);
}

class AddVideoStep3VM {
  final String username;
  final String location;
  final String type;

  AddVideoStep3VM({
    required this.username,
    required this.location,
    required this.type,
  });
}

class WithExistingSubCategoryAddVideoStep3Page extends StatelessWidget {
  static get route => 'WithExistingSubCategoryAddVideoStep3Page';

  List<AddVideoStep3VM> list = [
    AddVideoStep3VM(
      username: "username1",
      location: "location",
      type: "country",
    ),
    AddVideoStep3VM(
      username: "username2",
      location: "location",
      type: "word",
    ),
    AddVideoStep3VM(
      username: "username3",
      location: "location",
      type: "country",
    ),
    AddVideoStep3VM(
      username: "username",
      location: "location",
      type: "continent",
    ),
    // WithExistingSubCategoryAddVideoStep3Tile(
    //   username: 'username',
    //   location: 'location',
    //   type: 'Country',
    // ),
    // WithExistingSubCategoryAddVideoStep3Tile(
    //   username: 'username',
    //   location: 'location',
    //   type: 'Country',
    // ),
    // WithExistingSubCategoryAddVideoStep3Tile(
    //   username: 'username',
    //   location: 'location',
    //   type: 'Country',
    // ),
    // WithExistingSubCategoryAddVideoStep3Tile(
    //   username: 'username',
    //   location: 'location',
    //   type: 'Country',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    final TNotifier notifier = TNotifier();
    final List<Widget> tiles = [];
    list.forEach((vm) {
      tiles.add(
        ChangeNotifierProvider.value(
          value: notifier,
          child: WithExistingSubCategoryAddVideoStep3Tile(
            username: vm.username,
            location: vm.location,
            type: vm.type,
          ),
        ),
      );
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.068423645320197,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(
                    left:
                        MediaQuery.of(context).size.width * 0.0426666666666667,
                    right:
                        MediaQuery.of(context).size.width * 0.0426666666666667,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                      ))),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0172413793103448,
                  left: MediaQuery.of(context).size.width * 0.0426666666666667,
                  right: MediaQuery.of(context).size.width * 0.0426666666666667,
                ),
                child: Text(
                  'Step 3',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.00862068965517241,
                  left: MediaQuery.of(context).size.width * 0.0426666666666667,
                  right: MediaQuery.of(context).size.width * 0.0426666666666667,
                ),
                child: Text(
                  'Choose and enter your video category and subcategory',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0184729064039409,
                ),
                height: MediaQuery.of(context).size.height * 0.544334975369458,
                child: ScrollConfiguration(
                  behavior: NoGlowBehavior(),
                  child: ListView.builder(
                    itemCount: tiles.length,
                    itemBuilder: (context, index) {
                      return tiles[index];
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0270935960591133,
                  left: MediaQuery.of(context).size.width * 0.130666666666667,
                  right: MediaQuery.of(context).size.width * 0.109333333333333,
                ),
                child: CustomButton(
                    content: 'Start Duel',
                    func: () {
                      // Navigator.push(context, FadeRoute(page: MainPage()));
                      Navigator.pushNamedAndRemoveUntil(
                          context, MainPage.route, (route) => false);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
