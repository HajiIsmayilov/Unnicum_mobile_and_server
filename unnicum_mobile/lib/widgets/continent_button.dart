import 'package:flutter/material.dart';

class ContinentButton extends StatelessWidget {
  final String continents;

  ContinentButton({
    required this.continents,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.0373333333333333,
      ),
      height: MediaQuery.of(context).size.height * 0.126847290640394,
      width: MediaQuery.of(context).size.height * 0.178571428571429,
      alignment: Alignment.bottomLeft,
      color: Color.fromRGBO(196, 196, 196, 1),
      child: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          bottom: MediaQuery.of(context).size.height * 0.0197044334975369,
        ),
        child: Text(
          continents,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
