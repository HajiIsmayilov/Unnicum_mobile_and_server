import 'package:unnicum_mobile/notifiers/voting_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Voting extends StatelessWidget {
  final int count1;
  final int count2;

  Voting({
    required this.count1,
    required this.count2,
  });

  @override
  Widget build(BuildContext context) {
    var notifier = VotingNotifier();

    return ChangeNotifierProvider<VotingNotifier>(
      create: (context) => notifier,
      builder: (context, child) => Column(
        children: [
          Consumer<VotingNotifier>(
            builder: (context, votingNotifier, child) {
              votingNotifier.count1 = 24;
              votingNotifier.count2 = 21;
              return Column(
                children: [
                  Container(
                    child: LinearProgressIndicator(
                      value: votingNotifier.percentage,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [Text('${votingNotifier.count1}'), Expanded(child: Container()), Text('${votingNotifier.count2}')],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.00369458128078818,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.117333333333333,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              votingNotifier.updateButton(1);
                              votingNotifier.readyPercentage();
                            },
                            child: Container(
                              child: Icon(
                                Icons.circle,
                                size: MediaQuery.of(context).size.width * 0.117333333333333,
                                color: votingNotifier.isSelected1 ? Colors.blue : Color.fromRGBO(139, 139, 139, 1),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.117333333333333,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              votingNotifier.updateButton(2);
                              votingNotifier.readyPercentage();
                            },
                            child: Container(
                              child: Icon(
                                Icons.circle,
                                size: MediaQuery.of(context).size.width * 0.117333333333333,
                                color: votingNotifier.isSelected2 ? Colors.blue : Color.fromRGBO(139, 139, 139, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
