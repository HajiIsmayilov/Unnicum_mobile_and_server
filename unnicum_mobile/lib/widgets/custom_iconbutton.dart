import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() func;

  const CustomIconButton({required this.func});

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
            child: Icon(
              Icons.circle,
              color: Color.fromRGBO(231, 231, 231, 1),
            ),
          ),
        ),
        color: Colors.transparent,
      ),
      color: Color.fromRGBO(196, 196, 196, 1),
    );
  }
}
