import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Preview extends StatefulWidget {
  //final String? outputVideoPath;
  final File file;

  const Preview(this.file, {Key? key}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Preview"),
      ),
      body: Center(
        child: AspectRatio(
          //aspectRatio: _controller.value.aspectRatio,
          aspectRatio: 1.24,
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
