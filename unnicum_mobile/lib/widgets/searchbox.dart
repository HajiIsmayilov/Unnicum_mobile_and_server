import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.0541871921182266,
        left: MediaQuery.of(context).size.width * 0.0426666666666667,
        right: MediaQuery.of(context).size.width * 0.0426666666666667,
      ),
      color: Color.fromRGBO(233, 233, 233, 1),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.circle,
            size: MediaQuery.of(context).size.width * 0.0613333333333333,
            color: Color.fromRGBO(128, 128, 128, 1),
          ),
          hintText: 'Search query',
          hintStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
