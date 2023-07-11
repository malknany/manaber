// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:video_player/video_player.dart';

class ModelVideoes {
  final List<File> videoFiles;
  final List<VideoPlayerController> controllers;
  final List<bool> isPlayingList;
  final String tilte;
  ModelVideoes({
    required this.videoFiles,
    required this.controllers,
    required this.isPlayingList,
    required this.tilte
  });
}
