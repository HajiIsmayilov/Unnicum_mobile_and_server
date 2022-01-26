import 'package:unnicum_mobile/widgets/home_duel_rectangles.dart';
import 'package:unnicum_mobile/widgets/home_duel_usernames_template.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Duel extends StatefulWidget {
  final String firstUsername;
  final String secondUsername;
  final String category;
  final String subCategory;
  final DateTime dateTime;
  final int count1;
  final int count2;
  final int t1;
  final int t2;

  Duel({
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
  State<Duel> createState() => _DuelState();
}

class _DuelState extends State<Duel> {
  bool isSelected1 = false;

  bool isSelected2 = false;

  bool isSelected = false;

  double percentage = 0;

  int c1 = 24;
  int c2 = 21;

  double calcPercentage(int count1, int count2) {
    return (count1 * 100 / (count1 + count2)) / 100;
  }

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
            firstUsername: widget.firstUsername,
            secondUsername: widget.secondUsername,
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
            child: Column(
              children: [
                isSelected
                    ? Container(
                        child: Column(
                          children: [
                            Container(
                              child: LinearProgressIndicator(
                                value: calcPercentage(c1, c2),
                                color: Colors.blue,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('${c1}'),
                                  Expanded(child: Container()),
                                  Text('${c2}')
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
                                  // updateButton(
                                  //     1, widget.count1, widget.count2);

                                  // percentage = calcPercentage(
                                  //     widget.count1, widget.count2);

                                  if (isSelected2) {
                                    isSelected2 = false;
                                    // count2--;
                                    c2--;
                                  }

                                  if (isSelected1) {
                                    isSelected1 = false;
                                    c1--;
                                  } else {
                                    isSelected1 = true;
                                    c1++;
                                  }

                                  setState(() {
                                    isSelected = true;
                                  });
                                  //////////////

                                  // votingNotifier.updateButton(1);
                                  // votingNotifier.readyPercentage();
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.circle,
                                    size: MediaQuery.of(context).size.width *
                                        0.117333333333333,
                                    color: isSelected1
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
                                  // updateButton(
                                  //     2, widget.count1, widget.count2);

                                  // percentage = calcPercentage(
                                  //     widget.count1, widget.count2);

                                  if (isSelected1) {
                                    isSelected1 = false;
                                    c1--;
                                  }

                                  if (isSelected2) {
                                    isSelected2 = false;
                                    c2--;
                                  } else {
                                    isSelected2 = true;
                                    c2++;
                                  }

                                  setState(() {
                                    isSelected = true;
                                  });
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.circle,
                                    size: MediaQuery.of(context).size.width *
                                        0.117333333333333,
                                    color: isSelected2
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
                                NumberFormat('###,###', 'en_US')
                                    .format(widget.t2),
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
                                NumberFormat('###,###', 'en_US')
                                    .format(widget.t2),
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
                          '${widget.category} | ${widget.subCategory}',
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
            ),
          ),
        ],
      ),
    );
  }
}
