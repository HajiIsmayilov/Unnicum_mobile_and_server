import 'dart:io';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:unnicum_mobile/notifiers/category_notifier.dart';
import 'package:unnicum_mobile/pages/with_existing_subcategory_add_video_step_3_page.dart';
import 'package:unnicum_mobile/utilities/glow/noglow.dart';
import 'package:unnicum_mobile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WithExistingSubCategoryAddVideoStep2PageArgs {
  final File file;
  final Image image;

  WithExistingSubCategoryAddVideoStep2PageArgs(this.file, this.image);
}

class WithExistingSubCategoryAddVideoStep2Page extends StatelessWidget {
  static get route => 'WithExistingSubCategoryAddVideoStep2Page';

  const WithExistingSubCategoryAddVideoStep2Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as WithExistingSubCategoryAddVideoStep2PageArgs;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: Scaffold(
        body: ChangeNotifierProvider<CategoryNotifier>(
          create: (context) => CategoryNotifier(),
          builder: (context, child) => SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.068423645320197,
                left: MediaQuery.of(context).size.width * 0.0426666666666667,
                right: MediaQuery.of(context).size.width * 0.0426666666666667,
              ),
              child: ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                          )),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0172413793103448,
                        ),
                        child: Text(
                          'Step 2',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.00862068965517241,
                        ),
                        child: Text(
                          'Choose and enter your video category and subcategory',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0381773399014778,
                          left: MediaQuery.of(context).size.width *
                              0.0666666666666667,
                        ),
                        child: Text(
                          'Cover',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0172413793103448,
                          left: MediaQuery.of(context).size.width *
                              0.0613333333333333,
                        ),
                        height: MediaQuery.of(context).size.height *
                            0.107142857142857,
                        width: MediaQuery.of(context).size.width * 0.232,
                        color: Color.fromRGBO(128, 128, 128, 1),
                        child: args.image,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0381773399014778,
                          left: MediaQuery.of(context).size.width * 0.072,
                          right: MediaQuery.of(context).size.width * 0.072,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category'),
                            Consumer<CategoryNotifier>(
                              builder: (context, notifier, child) =>
                                  DropdownButtonFormField(
                                value: notifier.currentCategory,
                                items: notifier.categories
                                    .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value == 'nope'
                                              ? 'Choose your category'
                                              : value,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (newValue) {
                                  var data = newValue as String;

                                  notifier.setCurrentCategory(data);
                                },
                                icon: const Icon(Icons.expand_more_sharp),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0467980295566503,
                          left: MediaQuery.of(context).size.width * 0.072,
                          right: MediaQuery.of(context).size.width * 0.072,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SubCategory'),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your subcategory',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0467980295566503,
                          left: MediaQuery.of(context).size.width * 0.072,
                        ),
                        child: const Text(
                          'Video Information',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.020935960591133,
                          left: MediaQuery.of(context).size.width * 0.072,
                          right: MediaQuery.of(context).size.width * 0.072,
                        ),
                        height: MediaQuery.of(context).size.height *
                            0.0948275862068965,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width *
                                0.0506666666666667,
                            right: MediaQuery.of(context).size.width *
                                0.0506666666666667,
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Enter info',
                            ),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0394088669950739,
                          left: MediaQuery.of(context).size.width *
                              0.0666666666666667,
                          right: MediaQuery.of(context).size.width *
                              0.0666666666666667,
                        ),
                        child: CustomButton(
                            content: 'Next',
                            func: () {
                              Navigator.pushNamed(
                                context,
                                WithExistingSubCategoryAddVideoStep3Page.route,
                                arguments:
                                    WithExistingSubCategoryAddVideoStep3PageArgs(
                                  args.file,
                                  args.image,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
