import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentTile extends StatelessWidget {
  final String url;
  final String text;
  final DateTime date;

  const CommentTile({
    Key? key,
    required this.url,
    required this.text,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(url),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 5,
              right: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 75,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  timeago.format(date, locale: 'en_short'),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(139, 139, 139, 1),
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
