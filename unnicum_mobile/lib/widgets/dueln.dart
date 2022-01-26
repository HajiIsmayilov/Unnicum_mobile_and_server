import 'package:unnicum_mobile/notifiers/duel_notifier.dart';
import 'package:unnicum_mobile/widgets/home_duel_rectangles.dart';
import 'package:unnicum_mobile/widgets/home_duel_usernames_template.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DuelN extends StatelessWidget {
  final String firstUsername;
  final String secondUsername;
  final String category;
  final String subCategory;
  final DateTime dateTime;
  final int count1;
  final int count2;
  final int t1;
  final int t2;

  DuelN({
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

  double calcPercentage(int count1, int count2) {
    return (count1 * 100 / (count1 + count2)) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DuelNotifier>(
      create: (context) => DuelNotifier(count1, count2),
      builder: (context, child) => Container(
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
              child:
                  Consumer<DuelNotifier>(builder: (context, notifier, child) {
                return Column(
                  children: [
                    notifier.isSelected
                        ? Container(
                            child: Column(
                              children: [
                                Container(
                                  child: LinearProgressIndicator(
                                    value: calcPercentage(
                                      notifier.count1,
                                      notifier.count2,
                                    ),
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text('${notifier.count1}'),
                                      Expanded(child: Container()),
                                      Text('${notifier.count2}')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(height: 1),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.00369458128078818,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.117333333333333,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      notifier.updateButton(1);
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.circle,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.117333333333333,
                                        color: notifier.isSelected1
                                            ? Colors.blue
                                            : Color.fromRGBO(139, 139, 139, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Container(
                                  padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.117333333333333,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      notifier.updateButton(2);
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.circle,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.117333333333333,
                                        color: notifier.isSelected2
                                            ? Colors.blue
                                            : Color.fromRGBO(139, 139, 139, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    0.0283251231527094),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //////////////////////////////////////////////////
                                Container(
                                  child: Icon(
                                    Icons.circle,
                                    size: MediaQuery.of(context).size.width *
                                        0.0533333333333333,
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.0213333333333333,
                                  ),
                                  child: Text(
                                    NumberFormat('###,###', 'en_US').format(t2),
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                ///////////////////////////////////////////////////

                                Container(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.0613333333333333,
                                  ),
                                  child: Icon(
                                    Icons.circle,
                                    size: MediaQuery.of(context).size.width *
                                        0.0533333333333333,
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.0213333333333333,
                                  ),
                                  child: Text(
                                    NumberFormat('###,###', 'en_US').format(t2),
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),

                                ////////////////////////////////////////////////////

                                Expanded(child: Container()),

                                GestureDetector(
                                  onTap: () {
                                    print('more taped');
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.more_horiz,
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ///////////////////////////////
                          Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.0270935960591133,
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
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
