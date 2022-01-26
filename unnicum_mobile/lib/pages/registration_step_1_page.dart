import '../funcs/validator.dart';
import '../pages/login_page.dart';
import '../pages/registration_step_2_page.dart';
import '../utilities/glow/noglow.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_iconbutton.dart';

import 'package:flutter/material.dart';

class RegistrationStep1Page extends StatelessWidget {
  static get route => 'RegistrationStep1Page';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0874384236453202,
              left: MediaQuery.of(context).size.width * 0.12,
              right: MediaQuery.of(context).size.width * 0.12,
            ),
            child: ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Step 1',
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
                            0.0541871921182266,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email'),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                            ),
                            validator: (value) => value!.isValidEmail()
                                ? null
                                : "Check your email",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.0492610837438424,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Password'),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                              suffixIcon: Icon(
                                Icons.circle,
                                color: Color.fromRGBO(196, 196, 196, 1),
                              ),
                            ),
                            controller: _pass,
                            validator: (value) => value!
                                    .isPasswordCompliant(value)
                                ? null
                                : "At least one digit, one lowercase character,\none uppercase character and one special character",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.0467980295566503,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Confirm password'),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                              suffixIcon: Icon(
                                Icons.circle,
                                color: Color.fromRGBO(196, 196, 196, 1),
                              ),
                            ),
                            controller: _confirmPass,
                            validator: (value) =>
                                value == _pass.text ? null : "Not Match",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.0541871921182266,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Or',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.0283251231527094,
                      ),
                      child: CustomIconButton(
                        func: () {
                          // Navigator.push(context, FadeRoute(page: LoginPage()));
                          Navigator.pushNamed(context, LoginPage.route);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            0.0270935960591133,
                      ),
                      child: CustomIconButton(
                        func: () {
                          // Navigator.push(context, FadeRoute(page: LoginPage()));
                          Navigator.pushNamed(context, LoginPage.route);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0911330049261084),
                      child: CustomButton(
                        content: 'Next',
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigator.push(context,
                            //     FadeRoute(page: RegistrationStep2Page()));
                            Navigator.pushNamed(
                                context, RegistrationStep2Page.route);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
