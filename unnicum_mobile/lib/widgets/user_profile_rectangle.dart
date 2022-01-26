import 'package:flutter/material.dart';

enum UserProfileRectangleMode {
  none,
  world,
}

class UserProfileRectangle extends StatelessWidget {
  final UserProfileRectangleMode mode;

  UserProfileRectangle({
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return mode == UserProfileRectangleMode.world
        ? Container(
            height: MediaQuery.of(context).size.height * 0.125615763546798,
            width: MediaQuery.of(context).size.width * 0.429333333333333,
            color: Color.fromRGBO(196, 196, 196, 1),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: new EdgeInsets.only(right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Icon(
                            Icons.circle,
                            size: MediaQuery.of(context).size.width * 0.0613333333333333,
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.0213333333333333,
                          ),
                          child: Text(
                            'World',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.125615763546798,
            width: MediaQuery.of(context).size.width * 0.429333333333333,
            color: Color.fromRGBO(196, 196, 196, 1),
          );
  }
}
