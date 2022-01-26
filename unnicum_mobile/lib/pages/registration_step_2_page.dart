import 'package:geocoding/geocoding.dart';

import '../notifiers/ages_notifier.dart';
import '../notifiers/locations_notifier.dart';
import '../pages/registration_step_3_page.dart';
import '../utilities/glow/noglow.dart';
import '../widgets/custom_button.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationStep2Page extends StatelessWidget {
  RegistrationStep2Page({Key? key}) : super(key: key);

  static get route => 'RegistrationStep2Page';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => AgeNotifier(),
              ),
              ChangeNotifierProvider(
                create: (context) => LocationNotifier(),
              ),
            ],
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0874384236453202,
                left: MediaQuery.of(context).size.width * 0.114666666666667,
              ),
              child: ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text(
                          'Step 2',
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
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Photo or Logo',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.0172413793103448,
                                  ),
                                  height: MediaQuery.of(context).size.height *
                                      0.151477832512315,
                                  width:
                                      MediaQuery.of(context).size.width * 0.328,
                                  decoration: DottedDecoration(
                                    strokeWidth: 1.75,
                                    color: Colors.black,
                                    shape: Shape.box,
                                  ),
                                  child: const Icon(
                                    Icons.circle,
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                    size: 44,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.056,
                              ),
                              child: const Text(
                                'Upload your Photo or\n your Organisation Logo',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(196, 196, 196, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0541871921182266,
                          right: MediaQuery.of(context).size.width *
                              0.114666666666667,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Username'),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText:
                                    'Enter your Nick or Organization Name',
                              ),
                              validator: (value) => value!.trim().length > 4
                                  ? null
                                  : 'Username must be at least 4 characters in length',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0492610837438424,
                          right: MediaQuery.of(context).size.width *
                              0.114666666666667,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Age'),
                            Consumer<AgeNotifier>(
                              builder: (context, agesNotifier, child) {
                                return DropdownButtonFormField(
                                  value: agesNotifier.currentAge,
                                  items: agesNotifier.ages
                                      .map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        value == 0
                                            ? 'Choose your real age'
                                            : value.toString(),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    var data = newValue as int;
                                    agesNotifier.setCurrentAge(data);
                                  },
                                  validator: (value) => value != 0
                                      ? null
                                      : 'Choose your real age',
                                  icon: const Icon(Icons.expand_more_sharp),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0467980295566503,
                          right: MediaQuery.of(context).size.width *
                              0.114666666666667,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Location'),
                            Consumer<LocationNotifier>(
                              builder: (context, locationsNotifier, child) {
                                return DropdownButtonFormField(
                                  value: locationsNotifier.currentLocation,
                                  items: locationsNotifier.locations
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value == 'nope'
                                            ? 'Choose your country and city'
                                            : value,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    var data = newValue as String;
                                    locationsNotifier.setCurrentLocation(data);
                                  },
                                  validator: (value) => value != 'nope'
                                      ? null
                                      : 'Choose your country and city',
                                  icon: const Icon(Icons.expand_more_sharp),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0997536945812808,
                          right: MediaQuery.of(context).size.width *
                              0.114666666666667,
                        ),
                        child: CustomButton(
                          content: 'Next',
                          func: () {
                            if (_formKey.currentState!.validate()) {
                              // Navigator.push(context,
                              //     FadeRoute(page: RegistrationStep3Page()));
                              Navigator.pushNamed(
                                  context, RegistrationStep3Page.route);
                            }
                          },
                        ),
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
