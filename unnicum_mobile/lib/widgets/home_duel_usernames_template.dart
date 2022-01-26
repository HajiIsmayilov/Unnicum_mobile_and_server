import 'package:unnicum_mobile/pages/user_profile_2_page.dart';
import 'package:unnicum_mobile/routes/fade_route.dart';
import 'package:flutter/material.dart';

class HomeDuelUsername extends StatelessWidget {
  final String firstUsername;
  final String secondUsername;

  HomeDuelUsername({
    required this.firstUsername,
    required this.secondUsername,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.0369458128078818,
          width: MediaQuery.of(context).size.width * 0.08,
          color: Color.fromRGBO(196, 196, 196, 1),
        ),
        Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.0266666666666667,
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, FadeRoute(page: UserProfile2Page()));
              },
              child: Text(
                firstUsername,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        ////////////////////////////////////////////////////
        Expanded(child: Container()),
        Container(
          child: Icon(
            Icons.circle,
            size: MediaQuery.of(context).size.width * 0.0613333333333333,
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
        ),
        Expanded(child: Container()),
        /////////////////////////////////////////////////
        Container(
            child: GestureDetector(
          onTap: () {
            Navigator.push(context, FadeRoute(page: UserProfile2Page()));
          },
          child: Text(
            secondUsername,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.0293333333333333,
          ),
          height: MediaQuery.of(context).size.height * 0.0369458128078818,
          width: MediaQuery.of(context).size.width * 0.08,
          color: Color.fromRGBO(196, 196, 196, 1),
        ),
      ],
    );
  }
}
