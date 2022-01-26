import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String content;

  SettingTile({
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.0426666666666667,
        right: MediaQuery.of(context).size.width * 0.0651733333333333,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0147783251231527,
            ),
            child: Row(
              children: [
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_forward_ios,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0147783251231527,
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
