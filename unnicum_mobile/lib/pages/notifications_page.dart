import 'package:unnicum_mobile/utilities/glow/noglow.dart';
import 'package:unnicum_mobile/widgets/notification_tile.dart';
import 'package:unnicum_mobile/widgets/notification_tile_with_button.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  List<Widget> list = [
    NotificationTileWithButton(
      content:
          'New the her nor case that lady paid read. Invitation friendship travelling eat everything the out.',
      date: DateTime.now().subtract(
        new Duration(days: 15),
      ),
    ),
    NotificationTile(
      content:
          'Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our.',
      date: DateTime.now().subtract(
        new Duration(seconds: 5),
      ),
    ),
    NotificationTileWithButton(
      content:
          'New the her nor case that lady paid read. Invitation friendship travelling eat everything the out.',
      date: DateTime.now().subtract(
        new Duration(hours: 12),
      ),
    ),
    NotificationTile(
      content:
          'Own handsome delicate its property mistress her end appetite. Mean are sons too sold nor said. Son share three men power boy you. Now merits wonder effect garret own. ',
      date: DateTime.now().subtract(
        new Duration(seconds: 5),
      ),
    ),
    NotificationTile(
      content:
          'Defective in do recommend suffering. House it seven in spoil tiled court.',
      date: DateTime.now().subtract(
        new Duration(seconds: 5),
      ),
    ),
    NotificationTileWithButton(
      content:
          'New the her nor case that lady paid read. Invitation friendship travelling eat everything the out.',
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0689655172413793,
              ),
              alignment: Alignment.center,
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0411699507389163,
                ),
                child: ScrollConfiguration(
                  behavior: NoGlowBehavior(),
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) => list[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
