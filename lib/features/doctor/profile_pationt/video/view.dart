// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   const VideoScreen({super.key});

//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   VideoPlayerController? _controller;
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _pickVideo() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.video,
//     allowMultiple: false,
//   );
//   if (result != null) {
//     File file = File(result.files.single.path!);
//     _controller = VideoPlayerController.file(file)..initialize().then((_) {
//       setState(() {});
//       _controller!.play();
//     });
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//   onTap: _pickVideo,
//   child: _controller != null && _controller!.value.isInitialized
//       ? AspectRatio(
//           aspectRatio: _controller!.value.aspectRatio,
//           child: VideoPlayer(_controller!),
//         )
//       : Container(),
// ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:chewie/chewie.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:manaber/shared/styles/colors.dart';
// import 'package:video_player/video_player.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<PlatformFile> _videos = [];
//   List<ChewieController> _videoPlayers = [];

//   Future<void> _pickVideos() async {
//     List<PlatformFile> resultList = [];
//     try {
//       resultList = (await FilePicker.platform.pickFiles(
//         type: FileType.video,
//         allowMultiple: true,
//       )) as List<PlatformFile>;
//     } on Exception catch (e) {
//       // Handle exception
//     }
//     if (!mounted) return;
//     setState(() {
//       _videos = resultList;
//       _videoPlayers.clear();
//       for (int i = 0; i < _videos.length; i++) {
//         PlatformFile video = _videos[i];
//         VideoPlayerController videoPlayerController =
//             VideoPlayerController.file(File(video.path!));
//         ChewieController chewieController = ChewieController(
//           videoPlayerController: videoPlayerController,
//           autoPlay: false,
//           looping: false,
//         );
//         _videoPlayers.add(chewieController);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//         itemCount: _videos.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Column(
//             children: [
//               Text(
//                 'Video ${index + 1}',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Chewie(
//                 controller: _videoPlayers[index],
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.primarycolor,
//         onPressed: _pickVideos,
//         tooltip: 'Pick Videos',
//         child: Icon(Icons.video_library),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (int i = 0; i < _videoPlayers.length; i++) {
//       _videoPlayers[i].dispose();
//     }
//     super.dispose();
//   }
// }
