import 'package:flutter/material.dart';

class NotificationTileWithButton extends StatelessWidget {
  final String content;
  final DateTime date;

  NotificationTileWithButton({
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0246305418719212,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left:
                        MediaQuery.of(context).size.width * 0.0426666666666667,
                  ),
                  height:
                      MediaQuery.of(context).size.height * 0.0751231527093596,
                  width: MediaQuery.of(context).size.width * 0.162666666666667,
                  color: Color.fromRGBO(196, 196, 196, 1),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left:
                        MediaQuery.of(context).size.width * 0.0402933333333333,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.592,
                        child: Text(
                          content,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0061576354679803,
                        ),
                        child: const Text(
                          "time",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(139, 139, 139, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left:
                        MediaQuery.of(context).size.width * 0.0213333333333333,
                  ),
                  height:
                      MediaQuery.of(context).size.height * 0.0751231527093596,
                  width: MediaQuery.of(context).size.width * 0.0986666666666667,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                  color: Color.fromRGBO(196, 196, 196, 1),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0246305418719212,
            ),
            child: Divider(
              thickness: 1,
              color: Color.fromRGBO(233, 233, 233, 1),
            ),
          ),
        ],
      ),
    );
  }
}
