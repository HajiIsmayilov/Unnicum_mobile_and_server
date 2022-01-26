import 'package:flutter/material.dart';

class HomeDuelRectangles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.271810344827586,
          width: MediaQuery.of(context).size.width * 0.914666666666667,
          color: Color.fromRGBO(196, 196, 196, 1),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.238916256157635,
            left: MediaQuery.of(context).size.width * 0.709333333333333,
          ),
          height: MediaQuery.of(context).size.height * 0.103448275862069,
          width: MediaQuery.of(context).size.width * 0.192,
          color: Color.fromRGBO(221, 220, 220, 1),
        )
      ],
    );
  }
}
