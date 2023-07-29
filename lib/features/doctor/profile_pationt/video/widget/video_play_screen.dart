import 'package:flutter/material.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen(
      {super.key, required this.urlVideo, required this.title});
  final String urlVideo;
  final String title;

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController _controller;

  bool slecte = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.urlVideo))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controller.value.isInitialized
                ? InkWell(
                    onTap: () {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    },
                    child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height / 1.5,
                        child: VideoPlayer(_controller)),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primarycolor)),
            VideoProgressIndicator(
              _controller,
              padding: const EdgeInsets.all(10),
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: AppColors.primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
