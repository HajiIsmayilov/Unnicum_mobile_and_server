import 'dart:developer';
import '../pages/comments_page.dart';
import '../pages/first_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';
import '../pages/registration_step_1_page.dart';
import '../pages/registration_step_2_page.dart';
import '../pages/registration_step_3_page.dart';
import '../pages/with_existing_subcategory_add_video_step_2_page.dart';
import '../pages/with_existing_subcategory_add_video_step_3_page.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  getUserLocation() async {
    loc.Location location = loc.Location();

    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;
    loc.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      _locationData.latitude as double,
      _locationData.longitude as double,
    );
    log('${placemarks.first.country}');
    log('${placemarks.first.subAdministrativeArea}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        FirstPage.route: (context) => FirstPage(),
        MainPage.route: (context) => const MainPage(),
        WithExistingSubCategoryAddVideoStep2Page.route: (context) =>
            const WithExistingSubCategoryAddVideoStep2Page(),
        WithExistingSubCategoryAddVideoStep3Page.route: (context) =>
            WithExistingSubCategoryAddVideoStep3Page(),
        RegistrationStep1Page.route: (context) => RegistrationStep1Page(),
        RegistrationStep2Page.route: (context) => RegistrationStep2Page(),
        RegistrationStep3Page.route: (context) => RegistrationStep3Page(),
        LoginPage.route: (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
