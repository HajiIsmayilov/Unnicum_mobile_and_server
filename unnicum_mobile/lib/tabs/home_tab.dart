import 'package:unnicum_mobile/pages/home_duel_page.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.108374384236453,
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(233, 233, 233, 1),
          title: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: 31,
            ),
            child: Text(
              'Unnicum',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: HomeDuelPage(),
      ),
    );
  }
}
