import 'package:unnicum_mobile/widgets/home_duel_rectangles.dart';
import 'package:unnicum_mobile/widgets/home_duel_usernames_template.dart';
import 'package:unnicum_mobile/widgets/numbers_and_more_icon.dart';
import 'package:unnicum_mobile/widgets/voting.dart';
import 'package:flutter/material.dart';

class HomeDuelOld extends StatelessWidget {
  final String firstUsername;
  final String secondUsername;
  final String category;
  final String subCategory;
  final DateTime dateTime;
  final int count1;
  final int count2;
  final int t1;
  final int t2;

  HomeDuelOld({
    required this.firstUsername,
    required this.secondUsername,
    required this.category,
    required this.subCategory,
    required this.dateTime,
    required this.count1,
    required this.count2,
    required this.t1,
    required this.t2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.0246305418719212,
        left: MediaQuery.of(context).size.width * 0.0426666666666667,
        right: MediaQuery.of(context).size.width * 0.0426666666666667,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeDuelUsername(
            firstUsername: firstUsername,
            secondUsername: secondUsername,
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0172413793103448,
            ),
            child: HomeDuelRectangles(),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0283251231527094,
            ),
            child: Voting(
              count1: count1,
              count2: count2,
            ),
          ),
          NumbersAndMoreIcon(
            t1: t1,
            t2: t2,
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0270935960591133,
            ),
            child: Text(
              '$category | $subCategory',
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
