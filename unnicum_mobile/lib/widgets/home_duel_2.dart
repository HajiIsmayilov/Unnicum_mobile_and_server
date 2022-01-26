import 'package:unnicum_mobile/widgets/home_duel_rectangles.dart';
import 'package:unnicum_mobile/widgets/home_duel_usernames_template.dart';
import 'package:unnicum_mobile/widgets/numbers_and_more_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeDuel2 extends StatelessWidget {
  final String firstUsername;
  final String secondUsername;
  final String category;
  final String subCategory;
  final DateTime dateTime;
  final int t1;
  final int t2;

  HomeDuel2({
    required this.firstUsername,
    required this.secondUsername,
    required this.category,
    required this.subCategory,
    required this.dateTime,
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
          /////////////////////////////////////////////////
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0184729064039409,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.117333333333333,
                  ),
                  child: Icon(
                    Icons.circle,
                    size: MediaQuery.of(context).size.width * 0.117333333333333,
                    color: Color.fromRGBO(139, 139, 139, 1),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.117333333333333,
                  ),
                  child: Icon(
                    Icons.circle,
                    size: MediaQuery.of(context).size.width * 0.117333333333333,
                    color: Color.fromRGBO(139, 139, 139, 1),
                  ),
                ),
              ],
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
          //////////////////////////////////////////////

          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0061576354679803,
            ),
            child: Text(
              DateFormat('d MMM, y').format(dateTime),
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(139, 139, 139, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
