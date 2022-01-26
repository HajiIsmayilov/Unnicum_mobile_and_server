import 'package:unnicum_mobile/pages/user_profile_2_page.dart';
import 'package:unnicum_mobile/routes/fade_route.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String username;
  final String location;
  final String type;

  UserTile({
    required this.username,
    required this.location,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.0246305418719212,
        horizontal: MediaQuery.of(context).size.width * 0.0426666666666667,
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.0997536945812808,
            width: MediaQuery.of(context).size.width * 0.216,
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.048,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, FadeRoute(page: UserProfile2Page()));
                  },
                  child: Text(
                    username,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.00492610837438424,
                  ),
                  child: Text(
                    location,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Icon(
                  Icons.circle,
                  color: Color.fromRGBO(196, 196, 196, 1),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0266666666666667,
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
