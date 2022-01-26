import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../notifiers/splash_notifier.dart';
import '../pages/login_page.dart';
import '../pages/registration_step_1_page.dart';
import '../widgets/custom_button.dart';

class FirstPage extends StatelessWidget {
  static get route => 'FirstPage';
  final InAppLocalhostServer _localhostServer =
      InAppLocalhostServer(port: 53511);
  Future<void> splashStart() async {
    await _localhostServer.start();
    _splashTimer = Timer.periodic(const Duration(milliseconds: 2100), (timer) {
      _splashNotifier.updateSplashAuthState = CrossFadeState.showSecond;
      timer.cancel();
    });
  }

  final _splashNotifier = SplashNotifier();
  late Timer _splashTimer;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashNotifier>(
        create: (context) => _splashNotifier,
        builder: (context, wg) {
          return Scaffold(
            body: FutureBuilder<void>(
                future: splashStart(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.22),
                            child: InAppWebView(
                              initialUrlRequest: URLRequest(
                                  url: Uri.parse(
                                      'http://localhost:53511/assets/splash/splash.html')),
                            ),
                          ),
                        ),
                        Consumer<SplashNotifier>(
                            builder: (context, notifier, wg) {
                          print(notifier.splashAuthState);
                          return Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width *
                                      0.78 *
                                      1.242718446601942 /
                                      2),
                              child: AnimatedCrossFade(
                                crossFadeState: notifier.splashAuthState,
                                duration: const Duration(milliseconds: 1800),
                                firstChild: Container(
                                  height: 0,
                                  width: 0,
                                ),
                                secondChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.16256157635468,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                      ),
                                      child: CustomButton(
                                        content: 'Sign up',
                                        func: () {
                                          //Navigator.push(context, FadeRoute(page: RegistrationStep1Page()));
                                          Navigator.pushNamed(
                                            context,
                                            RegistrationStep1Page.route,
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.0270935960591133,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                      ),
                                      child: CustomButton(
                                        content: 'Login',
                                        func: () {
                                          // Navigator.push(context,
                                          //     FadeRoute(page: LoginPage()));
                                          Navigator.pushNamed(
                                            context,
                                            LoginPage.route,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    );
                  }
                  return new Container(
                    color: Colors.white,
                  );
                }),
          );
        });
  }
}
