import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final void Function() func;

  CustomButton({
    required this.content,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          highlightColor: Colors.grey.withOpacity(0.4),
          splashColor: Colors.grey.withOpacity(0.5),
          onTap: func,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.0541871921182266,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              content,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        color: Colors.transparent,
      ),
      color: Color.fromRGBO(196, 196, 196, 1),
    );
  }
}
