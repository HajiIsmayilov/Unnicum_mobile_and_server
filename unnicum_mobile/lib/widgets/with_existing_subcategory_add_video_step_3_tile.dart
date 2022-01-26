import 'package:unnicum_mobile/notifiers/t_notofier.dart';
import 'package:unnicum_mobile/widgets/add_video_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WithExistingSubCategoryAddVideoStep3Tile extends StatelessWidget {
  final String username;
  final String location;
  final String type;

  WithExistingSubCategoryAddVideoStep3Tile({
    required this.username,
    required this.location,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.0246305418719212,
            left: MediaQuery.of(context).size.width * 0.0426666666666667,
            right: MediaQuery.of(context).size.width * 0.0426666666666667,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height:
                        MediaQuery.of(context).size.height * 0.0997536945812808,
                    width: MediaQuery.of(context).size.width * 0.216,
                    color: const Color.fromRGBO(196, 196, 196, 1),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.048,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            username,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                0.00492610837438424,
                          ),
                          child: Text(
                            location,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Color.fromRGBO(196, 196, 196, 1),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width *
                                  0.0266666666666667,
                            ),
                            child: Text(
                              type,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                      //AddVideoToggleButton(),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.0246305418719212,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 0.5,
                            ),
                          ),
                          child: Consumer<TNotifier>(
                            builder: (context, notifier, child) =>
                                GestureDetector(
                              onTap: () {
                                notifier.select('${username}_$type');
                              },
                              child: Icon(
                                Icons.circle,
                                size: MediaQuery.of(context).size.width *
                                    0.0613333333333333,
                                color: notifier.checkId('${username}_$type')
                                    ? const Color.fromRGBO(196, 196, 196, 1)
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ///////////////////////////////
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.0246305418719212,
          ),
          child: const Divider(
            thickness: 1,
            color: Color.fromRGBO(233, 233, 233, 1),
          ),
        ),
      ],
    );
  }
}
