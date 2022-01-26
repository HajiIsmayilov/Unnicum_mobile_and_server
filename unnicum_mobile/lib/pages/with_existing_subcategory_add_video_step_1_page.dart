import 'dart:io';

import '../pages/with_existing_subcategory_add_video_step_2_page.dart';
import '../utilities/glow/noglow.dart';
import '../utilities/video_editor/domain/block/controller.dart';
import '../utilities/video_editor/ui/cover/cover_viewer.dart';
import '../utilities/video_editor/ui/crop/crop_grid.dart';
import '../utilities/video_editor/ui/trim/trim_slider.dart';
import '../utilities/video_editor/ui/trim/trim_timeline.dart';
import '../widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';
import 'package:video_player/video_player.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';


class WithExistingAddVideoStep1Page extends StatefulWidget {
  static get route => 'WithExistingAddVideoStep1Page';
  WithExistingAddVideoStep1Page({Key? key, required this.file})
      : super(key: key);

  final File file;

  @override
  _WithExistingAddVideoStep1PageState createState() =>
      _WithExistingAddVideoStep1PageState();
}

class _WithExistingAddVideoStep1PageState
    extends State<WithExistingAddVideoStep1Page> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;
  final int durationWithSecond = 60;

  late bool _exported;
  String _exportText = "";
  late VideoEditorController _controller;

  @override
  void initState() {
    _exported = false;
    _controller = VideoEditorController.file(
      widget.file,
      maxDuration: Duration(seconds: durationWithSecond),
    )..initialize().then((_) => setState(() {}));

    //_controller.preferredCropAspectRatio = 16 / 10;
    //_controller.preferredCropAspectRatio = 1.24;
    // _controller.minCrop = const Offset(0.0, 0.4);
    // _controller.maxCrop = const Offset(1.0, 0.8);

    super.initState();
  }

  @override
  void dispose() {
    _exportingProgress.dispose();
    _isExporting.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _controller.initialized && !_exported
          ? SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Stack(
                  children: [
                    ScrollConfiguration(
                      behavior: NoGlowBehavior(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                              ),
                              onPressed: () {},
                            ),
                            Container(
                              child: const Text(
                                'Step 1',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    0.00862068965517241,
                              ),
                              child: const Text(
                                'Record or Upload Your Contentn and choose Cover\n',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              height: 560,
                              child: DefaultTabController(
                                length: 2,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            color: Colors.black,
                                            child: CropGridViewer(
                                              horizontalMargin: 0,
                                              controller: _controller,
                                              showGrid: false,
                                            ),
                                          ),
                                          AnimatedBuilder(
                                            animation: _controller.video,
                                            builder: (_, __) =>
                                                OpacityTransition(
                                              visible: !_controller.isPlaying,
                                              child: GestureDetector(
                                                onTap: _controller.video.play,
                                                child: Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _trimSlider(),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.088,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.0666666666666667,
                                      ),
                                      child: CustomButton(
                                        content: 'Next',
                                        func: () async {
                                          _isExporting.value = true;
                                          bool _firstStat = true;
                                          late Image image;
                                          _exported = true;

                                          _controller.video.pause();

                                          setState(() {});

                                          await _controller.extractCover(
                                            onCompleted: (cover) {
                                              if (!mounted) return;

                                              if (cover != null) {
                                                _exportText =
                                                    "Cover exported! ${cover.path}";
                                                image = Image.memory(
                                                  cover.readAsBytesSync(),
                                                  fit: BoxFit.cover,
                                                );
                                              }
                                            },
                                          );

                                          await _controller.exportVideo(
                                            onProgress: (statics) {
                                              if (_firstStat) {
                                                _firstStat = false;
                                              } else {
                                                _exportingProgress.value =
                                                    statics.getTime() /
                                                        _controller
                                                            .video
                                                            .value
                                                            .duration
                                                            .inMilliseconds;
                                              }
                                            },
                                            onCompleted: (file) {
                                              _isExporting.value = false;
                                              if (!mounted) return;
                                              if (file != null) {
                                                final VideoPlayerController
                                                    _videoController =
                                                    VideoPlayerController.file(
                                                  file,
                                                );

                                                _videoController.initialize();

                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (builder) {
                                                //       return WithExistingSubCategoryAddVideoStep2Page();

                                                //     },

                                                //   ),
                                                // );

                                                Navigator.pushNamed(
                                                    context,
                                                    WithExistingSubCategoryAddVideoStep2Page
                                                        .route,
                                                    arguments:
                                                        WithExistingSubCategoryAddVideoStep2PageArgs(
                                                      File(
                                                        _videoController
                                                            .dataSource,
                                                      ),
                                                      image,
                                                    ));

                                                _exported = false;
                                                //?????????????????????????????????????????

                                                _exportText =
                                                    "Video success export!";
                                              } else {
                                                _exportText =
                                                    "Error on export video :(";
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  Widget _trimSlider() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: Margin.vertical(height / 4),
      child: TrimSlider(
        child: TrimTimeline(
          controller: _controller,
          margin: const EdgeInsets.only(top: 10),
        ),
        controller: _controller,
        height: height,
        horizontalMargin: height / 4,
      ),
    );
  }
}
