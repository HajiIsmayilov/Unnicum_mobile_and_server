import 'package:flutter/material.dart';
import 'package:unnicum_mobile/enums/profile_mode.dart';
import 'package:unnicum_mobile/widgets/home_video.dart';
import 'package:unnicum_mobile/widgets/user_profile_rectangle.dart';

class UserProfileSelectionNotifier extends ChangeNotifier {
  ProfileMode _profileMode = ProfileMode.first;

  set updateMode(ProfileMode mode) {
    print(mode);
    _profileMode = mode;
    notifyListeners();
  }

  ProfileMode get profileMode => _profileMode;

  List<Widget> hv = [
    HomeVideo(
      username: 'username',
      t1: 123456,
      t2: 123456,
      description: 'description',
      dateTime: DateTime.now(),
      subCategory: 'subCategory',
      category: 'category',
    ),
    HomeVideo(
      username: 'username',
      t1: 123456,
      t2: 123456,
      description: 'description',
      dateTime: DateTime.now(),
      subCategory: 'subCategory',
      category: 'category',
    ),
  ];

  List<Widget> userProfileRectangles = [
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.world,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
    UserProfileRectangle(
      mode: UserProfileRectangleMode.none,
    ),
  ];

  List<Widget> getList() {
    var firstList = [
      HomeVideo(
        username: 'username',
        t1: 123456,
        t2: 123456,
        description: 'description',
        dateTime: DateTime.now(),
        subCategory: 'subCategory',
        category: 'category',
      ),
      HomeVideo(
        username: 'username',
        t1: 123456,
        t2: 123456,
        description: 'description',
        dateTime: DateTime.now(),
        subCategory: 'subCategory',
        category: 'category',
      )
    ];

    var secondList = [
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.world,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
      UserProfileRectangle(
        mode: UserProfileRectangleMode.none,
      ),
    ];

    return profileMode == ProfileMode.first ? firstList : secondList;
  }
}
