import 'package:flutter/material.dart';

class UserProfileInfoHeader extends StatelessWidget {
  final String username;
  final String location;
  final int age;
  final int views;
  final int judging;
  final int points;

  UserProfileInfoHeader({
    required this.username,
    required this.location,
    required this.age,
    required this.views,
    required this.judging,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.0320197044334975,
        left: MediaQuery.of(context).size.width * 0.0426666666666667,
      ),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: MediaQuery.of(context).size.width * 0.333333333333333,
            color: Color.fromRGBO(196, 196, 196, 1),
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
                    top: MediaQuery.of(context).size.height * 0.0258620689655172,
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
                          left: MediaQuery.of(context).size.width * 0.0426666666666667,
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
                          left: MediaQuery.of(context).size.width * 0.0293333333333333,
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
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.0213333333333333,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$points',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'points',
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
    );
  }
}
