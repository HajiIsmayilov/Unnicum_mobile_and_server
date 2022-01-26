import 'package:flutter/material.dart';
import 'package:unnicum_mobile/pages/main_page.dart';
import 'package:unnicum_mobile/routes/fade_route.dart';
import 'package:unnicum_mobile/utilities/glow/noglow.dart';
import 'package:unnicum_mobile/widgets/custom_button.dart';
import '../widgets/custom_iconbutton.dart';
import '../funcs/validator.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static get route => 'LoginPage';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.153940886699507,
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
                      child: Text(
                        'Welcome',
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
                          Text('Email'),
                          TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                              ),
                              validator: (value) => value!.isValidEmail()
                                  ? null
                                  : "Check your email"),
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
                          Text('Password'),
                          TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                suffixIcon: Icon(
                                  Icons.circle,
                                  color: Color.fromRGBO(196, 196, 196, 1),
                                ),
                              ),
                              validator: (value) =>
                                  value!.isPasswordCompliant(value)
                                      ? null
                                      : "Example: Hello123!"),
                          ////////////////////////////////////////////////////////
                          Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.0381773399014778,
                            ),
                            alignment: Alignment.center,
                            child: Text(
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
                                Navigator.push(
                                    context, FadeRoute(page: MainPage()));
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
                                Navigator.push(
                                    context, FadeRoute(page: MainPage()));
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.103448275862069,
                            ),
                            child: CustomButton(
                              content: 'Login',
                              func: () {
                                if (_formKey.currentState!.validate()) {
                                  // Navigator.push(
                                  //     context, FadeRoute(page: MainPage()));
                                  Navigator.pushNamed(context, MainPage.route);
                                }
                              },
                            ),
                          ),
                        ],
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
