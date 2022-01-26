import 'package:flutter/material.dart';

class CityButton extends StatelessWidget {
  final String city;

  CityButton({
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.0266666666666667,
      ),
      height: MediaQuery.of(context).size.height * 0.0960591133004926,
      width: MediaQuery.of(context).size.width * 0.288,
      alignment: Alignment.bottomLeft,
      color: Color.fromRGBO(196, 196, 196, 1),
      child: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          bottom: MediaQuery.of(context).size.height * 0.0197044334975369,
        ),
        child: Text(
          city,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
