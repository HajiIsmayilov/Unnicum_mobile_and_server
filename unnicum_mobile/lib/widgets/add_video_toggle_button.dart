import 'package:unnicum_mobile/notifiers/add_video_toggle_button_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddVideoToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddVideoButtonNotifier>(
      create: (context) => AddVideoButtonNotifier(),
      builder: (context, child) => 
      Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.0246305418719212,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 0.5,
            ),
          ),
          child: Consumer<AddVideoButtonNotifier>(
            builder: (context, notifier, child) => GestureDetector(
              onTap: () {
                notifier.updateButton();
              },
              child: Icon(
                Icons.circle,
                size: MediaQuery.of(context).size.width * 0.0613333333333333,
                color: notifier.isSelected ? Color.fromRGBO(196, 196, 196, 1) : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
