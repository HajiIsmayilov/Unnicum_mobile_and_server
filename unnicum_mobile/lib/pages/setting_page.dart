import 'package:unnicum_mobile/widgets/setting_tile.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0369458128078818,
                  left: MediaQuery.of(context).size.width * 0.016,
                  right: MediaQuery.of(context).size.width * 0.0549333333333333,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromRGBO(128, 128, 128, 1),
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0480295566502463,
                ),
                child: Divider(
                  thickness: 1,
                  color: Color.fromRGBO(233, 233, 233, 1),
                ),
              ),
              Column(
                children: [
                  'Change Cathegories',
                  'Change Skin',
                  'Change Email',
                  'Change Password',
                  'Notifications',
                  'Blocked Users',
                  'Terms of Use',
                  'Log Out',
                  'Delete Account',
                ].map((e) => SettingTile(content: e)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
