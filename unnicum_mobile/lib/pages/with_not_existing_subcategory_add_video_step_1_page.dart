import 'package:unnicum_mobile/notifiers/main_page_info_notifier.dart';
import 'package:unnicum_mobile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WithNotExistingSubCategoryAddVideoStep1Page extends StatelessWidget {
  const WithNotExistingSubCategoryAddVideoStep1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainPageInfoNotifier>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.068423645320197,
            left: MediaQuery.of(context).size.width * 0.0426666666666667,
            right: MediaQuery.of(context).size.width * 0.0426666666666667,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    provider.updateTab = 0;
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                  )),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0172413793103448,
                ),
                child: Text(
                  'Step 1',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.00862068965517241,
                ),
                child: Text(
                  'Record or Upload Your Content',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0517241379310345,
                ),
                child: Text(
                  'Video',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0197044334975369,
                ),
                height: MediaQuery.of(context).size.height * 0.233990147783251,
                width: double.infinity,
                color: Color.fromRGBO(127, 127, 127, 1),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.0135467980295567,
                        right: MediaQuery.of(context).size.width *
                            0.0346666666666667,
                      ),
                      child: Icon(
                        Icons.circle,
                        size: MediaQuery.of(context).size.width *
                            0.0986666666666667,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0935960591133005,
                  left: MediaQuery.of(context).size.width * 0.088,
                  right: MediaQuery.of(context).size.width * 0.0666666666666667,
                ),
                child: CustomButton(
                  content: 'Next',
                  func: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
