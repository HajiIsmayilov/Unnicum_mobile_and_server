import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get_time_ago/get_time_ago.dart';

class NotificationTile extends StatelessWidget {
  final String content;
  final DateTime date;

  NotificationTile({
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0246305418719212,
                  left: MediaQuery.of(context).size.width * 0.0426666666666667,
                ),
                height: MediaQuery.of(context).size.height * 0.0751231527093596,
                width: MediaQuery.of(context).size.width * 0.162666666666667,
                color: Color.fromRGBO(196, 196, 196, 1),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0246305418719212,
                  left: MediaQuery.of(context).size.width * 0.0402933333333333,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.712,
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
                        // TimeAgo.getTimeAgo(date, locale: 'en'),
                        "",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(139, 139, 139, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
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
