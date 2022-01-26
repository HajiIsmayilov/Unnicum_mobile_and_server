import 'package:flutter/material.dart';
import 'package:unnicum_mobile/utilities/glow/noglow.dart';
import 'package:unnicum_mobile/widgets/home_video.dart';

class HomeVideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String desc =
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.';
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeVideo(
                    username: 'Haciisma',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    t1: 123456,
                    t2: 123456,
                    description: desc,
                    dateTime: DateTime.now(),
                  ),
                  HomeVideo(
                    username: 'Bunik',
                    category: 'Category',
                    subCategory: 'SubCategory',
                    t1: 123456,
                    t2: 123456,
                    description: desc,
                    dateTime: DateTime.now(),
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
