import '../pages/main_page.dart';
import '../utilities/glow/noglow.dart';
import '../widgets/category_buttons_area.dart';
import '../widgets/custom_button.dart';

import 'package:flutter/material.dart';

class RegistrationStep3Page extends StatelessWidget {
  static get route => 'RegistrationStep3Page';
  List<String> list = [
    'All',
    'Style',
    'Food',
    'Art',
    'Tech',
    'Media',
    'Sport',
    'Extreme',
    'Nature',
    'Architecture',
    'Human',
    'Funny',
    'Photo contest',
    'Judgement',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.0874384236453202,
            left: MediaQuery.of(context).size.width * 0.114666666666667,
            right: MediaQuery.of(context).size.width * 0.130666666666667,
          ),
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      'Step 3',
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *
                          0.0455665024630542,
                    ),
                    child:const Text('Chose Categories you interested to judge'),
                  ),
                  CategoryButtonsArea(),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *
                          0.0233990147783251,
                    ),
                    child: const Text(
                      'You choice 3 categories',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *
                          0.0123152709359606,
                    ),
                    child: CustomButton(
                      content: 'Sign Up',
                      func: () {
                        // Navigator.push(context, FadeRoute(page: MainPage()));
                        Navigator.pushNamed(context, MainPage.route);
                      },
                    ),
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
