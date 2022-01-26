import 'package:flutter/material.dart';
import 'package:unnicum_mobile/utilities/glow/noglow.dart';
import 'package:unnicum_mobile/widgets/home_duel_2.dart';

class HomeDuel2Page extends StatelessWidget {
  const HomeDuel2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeDuel2(
                    firstUsername: 'Haci',
                    secondUsername: 'Hesen',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    t1: 123456,
                    t2: 123456,
                    dateTime: DateTime.now(),
                  ),
                  HomeDuel2(
                    firstUsername: 'Bunyamin',
                    secondUsername: 'Olexandr',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    t1: 123456,
                    t2: 123456,
                    dateTime: DateTime.now(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
