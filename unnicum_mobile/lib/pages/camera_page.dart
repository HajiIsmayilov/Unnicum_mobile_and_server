import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unnicum_mobile/pages/preview.dart';
import 'package:unnicum_mobile/pages/with_existing_subcategory_add_video_step_1_page.dart';

enum CameraType { Back, Front }

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  static get route => 'CameraScreen';

  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  late CameraController controller;
  late Future<void> cameraValue;
  bool enableAudio = true;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  CameraType _cameraType = CameraType.Back;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      cameras![_cameraType == CameraType.Back ? 0 : 1],
      ResolutionPreset.max,
      enableAudio: enableAudio,
    );
    cameraValue = controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // void _pickVideo() async {
  //   final XFile? file = await _picker.pickVideo(
  //     source: ImageSource.gallery,
  //   );

  //   if (file != null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (builder) {
  //           return WithExistingAddVideoStep1Page(file: File(file.path));
  //         },
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var tmp = MediaQuery.of(context).size;
                  final screenH = max(tmp.height, tmp.width);
                  final screenW = min(tmp.height, tmp.width);
                  tmp = controller.value.previewSize!;
                  final previewH = max(tmp.height, tmp.width);
                  final previewW = min(tmp.height, tmp.width);
                  final screenRatio = screenH / screenW;
                  final previewRatio = previewH / previewW;

                  print("H: $previewH");
                  print("W: $previewW");

                  return OverflowBox(
                    maxHeight: screenRatio > previewRatio
                        ? screenH
                        : screenW / previewW * previewH,
                    maxWidth: screenRatio > previewRatio
                        ? screenH / previewH * previewW
                        : screenW,
                    child: CameraPreview(controller),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            top: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 45,
                left: 6,
              ),
              child: !isRecoring
                  ? IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  : const SizedBox(),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      !isRecoring
                          ? IconButton(
                              color: Colors.transparent,
                              icon: const Icon(
                                // flash ? Icons.flash_on : Icons.flash_off,
                                Icons.photo_library_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () async {
                                final XFile? file = await _picker.pickVideo(
                                  source: ImageSource.gallery,
                                );

                                if (file != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) {
                                        return WithExistingAddVideoStep1Page(
                                            file: File(file.path));
                                      },
                                    ),
                                  );
                                }
                              },
                            )
                          : const SizedBox(
                              width: 28,
                            ),
                      GestureDetector(
                        onLongPress: () async {
                          await controller.startVideoRecording();
                          setState(() {
                            isRecoring = true;
                          });
                        },
                        onTap: () async {
                          XFile videopath =
                              await controller.stopVideoRecording();
                          setState(() {
                            isRecoring = false;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) {
                                return WithExistingAddVideoStep1Page(
                                  file: File(videopath.path),
                                );
                                //return Preview(File(videopath.path));
                                //return VideoEditor(file: File(videopath.path));
                              },
                            ),
                          );
                        },
                        child: isRecoring
                            ? const Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : const Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      !isRecoring
                          ? IconButton(
                              icon: Transform.rotate(
                                angle: transform,
                                child: const Icon(
                                  Icons.flip_camera_ios,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  iscamerafront = !iscamerafront;
                                  transform = transform + pi;
                                });
                                int cameraPos = iscamerafront ? 0 : 1;
                                controller = CameraController(
                                  cameras![cameraPos],
                                  ResolutionPreset.max,
                                );
                                cameraValue = controller.initialize();
                              },
                            )
                          : const SizedBox(
                              width: 28,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
