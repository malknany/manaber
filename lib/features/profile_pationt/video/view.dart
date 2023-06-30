import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _pickVideo() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.video,
    allowMultiple: false,
  );
  if (result != null) {
    File file = File(result.files.single.path!);
    _controller = VideoPlayerController.file(file)..initialize().then((_) {
      setState(() {});
      _controller!.play();
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
  onTap: _pickVideo,
  child: _controller != null && _controller!.value.isInitialized
      ? AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        )
      : Container(),
),
    );
  }
}