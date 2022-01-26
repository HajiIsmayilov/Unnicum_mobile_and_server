import 'package:unnicum_mobile/pages/user_profile_2_page.dart';
import 'package:unnicum_mobile/routes/fade_route.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class HomeVideo extends StatelessWidget {
  final String username;
  final int t1;
  final int t2;
  final String description;
  final String subCategory;
  final String category;
  final DateTime dateTime;

  HomeVideo({
    required this.username,
    required this.t1,
    required this.t2,
    required this.description,
    required this.dateTime,
    required this.subCategory,
    required this.category,
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
          Container(
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.0369458128078818,
                  width: MediaQuery.of(context).size.width * 0.08,
                  color: Color.fromRGBO(196, 196, 196, 1),
                ),
                Container(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.0266666666666667),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, FadeRoute(page: UserProfile2Page()));
                      },
                      child: Text(
                        username,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Expanded(
                  child: Container(),
                ),
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
          //////////////////////////////////
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0147783251231527,
            ),
            height: MediaQuery.of(context).size.height * 0.273399014778325,
            width: MediaQuery.of(context).size.width * 0.914666666666667,
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          //////////////////////////////////////////
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0147783251231527,
            ),
            child: Row(
              children: [
                //////////////////////////////////////////////////
                Container(
                  child: SvgPicture.asset(
                    "assets/icons/views.svg",
                    width: MediaQuery.of(context).size.width * 0.0323333333333333,
                    height: MediaQuery.of(context).size.height * 0.0323333333333333,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.0213333333333333,
                  ),
                  child: Text(
                    NumberFormat('###,###', 'en_US').format(t1),
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),

                ///////////////////////////////////////////////////

                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.0533333333333333,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/views.svg",
                    width: MediaQuery.of(context).size.width * 0.0323333333333333,
                    height: MediaQuery.of(context).size.height * 0.0323333333333333,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.0213333333333333,
                  ),
                  child: Text(
                    NumberFormat('###,###', 'en_US').format(t2),
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),

                /////////////////////////////////////////////////
                Expanded(child: Container()),
                Container(
                  child: SvgPicture.asset(
                    "assets/icons/location.svg",
                    width: MediaQuery.of(context).size.width * 0.0313333333333333,
                    height: MediaQuery.of(context).size.height * 0.0313333333333333,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.0213333333333333,
                  ),
                  child: Text(
                    'Worldsdfsdsdas',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
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

          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0258620689655172,
            ),
            child: ExpandableText(
              description,
              expandText: 'more',
              collapseText: 'less',
              maxLines: 2,
              linkColor: Color.fromRGBO(139, 139, 139, 1),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
