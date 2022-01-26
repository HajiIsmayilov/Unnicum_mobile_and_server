import 'package:unnicum_mobile/pages/notifications_page.dart';
import 'package:flutter/material.dart';

class NotificationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationPage(),
      ),
    );
  }
}
