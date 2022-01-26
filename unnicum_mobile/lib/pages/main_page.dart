import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../pages/camera_page.dart';
import '../tabs/camera_tab.dart';
import '../tabs/home_tab.dart';
import '../tabs/notification_tab.dart';
import '../tabs/profile_tab.dart';
import '../tabs/search_tab.dart';
import '../notifiers/main_page_info_notifier.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static get route => 'MainPage';
  @override
  Widget build(BuildContext context) {
    var size = 0.03;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainPageInfoNotifier(),
        ),
      ],
      builder: (context, widget) {
        var tabs = [
          HomeTab(),
          SearchTab(),
          CameraTab(),
          NotificationTab(),
          ProfileTab(),
        ];

        return Consumer<MainPageInfoNotifier>(builder: (context, info, child) {
          return ChangeNotifierProvider.value(
            value: info,
            child: Scaffold(
              body: ChangeNotifierProvider.value(
                value: info,
                child: tabs[info.tabIndex],
              ),
              backgroundColor: Colors.white,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) {
                          return CameraScreen();
                        },
                      ),
                    );
                    return;
                  }
                  info.updateTab = index;
                  print('index: $index');
                },
                currentIndex: info.tabIndex,
                backgroundColor: Colors.white,
                // showSelectedLabels: false,
                // showUnselectedLabels: false,
                selectedLabelStyle: TextStyle(
                  fontSize: 12,
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/search.svg",
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/search.svg",
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.circle,
                        color: Color.fromRGBO(226, 226, 226, 1),
                        size: MediaQuery.of(context).size.width * 0.12,
                      ),
                      activeIcon: Icon(
                        Icons.circle,
                        color: Color.fromRGBO(128, 128, 128, 1),
                        size: MediaQuery.of(context).size.width * 0.12,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      width: MediaQuery.of(context).size.width * size,
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      width: MediaQuery.of(context).size.width * size,
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                    label: 'Notification',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      width: MediaQuery.of(context).size.width * size,
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      width: MediaQuery.of(context).size.width * size,
                      height: MediaQuery.of(context).size.height * size,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
