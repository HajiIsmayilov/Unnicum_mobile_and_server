import 'package:flutter/material.dart';
import 'package:unnicum_mobile/utilities/glow/noglow.dart';
import 'package:unnicum_mobile/widgets/duel.dart';
import 'package:unnicum_mobile/widgets/dueln.dart';
import 'package:unnicum_mobile/widgets/home_duel.dart';

class HomeDuelPage extends StatelessWidget {
  const HomeDuelPage({Key? key}) : super(key: key);

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
                  DuelN(
                    firstUsername: 'firstUsername',
                    secondUsername: 'secondUsername',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    dateTime: DateTime.now(),
                    count1: 24,
                    count2: 21,
                    t1: 123456,
                    t2: 123456,
                  ),
                  Duel(
                    firstUsername: 'firstUsername',
                    secondUsername: 'secondUsername',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    dateTime: DateTime.now(),
                    count1: 24,
                    count2: 21,
                    t1: 123456,
                    t2: 123456,
                  ),
                  HomeDuelOld(
                    firstUsername: 'firstUsername',
                    secondUsername: 'secondUsername',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    dateTime: DateTime.now(),
                    count1: 24,
                    count2: 21,
                    t1: 123456,
                    t2: 123456,
                  ),
                  HomeDuelOld(
                    firstUsername: 'Bunik',
                    secondUsername: 'Alexandr',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    dateTime: DateTime.now(),
                    count1: 24,
                    count2: 21,
                    t1: 123456,
                    t2: 123456,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
