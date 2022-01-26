import 'package:unnicum_mobile/pages/my_profile_page.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MyProfilePage(
          username: 'Username',
          age: 17,
          judging: 1234,
          views: 12345,
          location: 'Location',
        ),
      ),
    );
  }
}
