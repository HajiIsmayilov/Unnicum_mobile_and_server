import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumbersAndMoreIcon extends StatelessWidget {
  final int t1;
  final int t2;

  NumbersAndMoreIcon({
    required this.t1,
    required this.t2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.0184729064039409,
      ),
      child: Row(
        children: [
          //////////////////////////////////////////////////
          Container(
            child: Icon(
              Icons.circle,
              size: MediaQuery.of(context).size.width * 0.0533333333333333,
              color: Color.fromRGBO(196, 196, 196, 1),
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
              left: MediaQuery.of(context).size.width * 0.0613333333333333,
            ),
            child: Icon(
              Icons.circle,
              size: MediaQuery.of(context).size.width * 0.0533333333333333,
              color: Color.fromRGBO(196, 196, 196, 1),
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
    );
  }
}
