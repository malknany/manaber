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
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   VideoPlayerController? _controller;
//   File? _videoFile;

//   Future pickVideo() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//       allowMultiple: false,
//     );

//     if (result != null) {
//       setState(() {
//         _videoFile = File(result.files.single.path!);
//         _controller = VideoPlayerController.file(_videoFile!)
//           ..initialize().then((_) {
//             setState(() {});
//           });
//       });
//     } else {
//       // User canceled the picker
//     }
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _videoFile == null
//                 ? Text('No video selected.')
//                 : _controller!.value.isInitialized
//                     ? SizedBox(
//                         height: MediaQuery.sizeOf(context).height / 2,
//                         width: double.infinity,
//                         child: AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: VideoPlayer(_controller!),
//                         ),
//                       )
//                     : CircularProgressIndicator(),
//             SizedBox(height: 20),
//             IconButton(
//               onPressed: pickVideo,
//               icon: Text('Pick Video'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:manaber/shared/styles/colors.dart';
// import 'package:manaber/shared/components/components.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   const VideoScreen({super.key});

//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   VideoPlayerController? _controller;
//   File? _videoFile;
//   bool _isPlaying = false;

//   Future pickVideo() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//       allowMultiple: false,
//     );

//     if (result != null) {
//       setState(() {
//         _videoFile = File(result.files.single.path!);
//         _controller = VideoPlayerController.file(_videoFile!)
//           ..initialize().then((_) {
//             setState(() {});
//           });
//       });
//     } else {
//       // User canceled the picker
//     }
//   }

//   void _togglePlayPause() {
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//         _isPlaying = false;
//       } else {
//         _controller!.play();
//         _isPlaying = true;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Screen'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               _videoFile == null
//                   ? const Text('No video selected.')
//                   : _controller!.value.isInitialized
//                       ? Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             SizedBox(
//                               height: MediaQuery.sizeOf(context).height / 2,
//                               child: AspectRatio(
//                                 aspectRatio: _controller!.value.aspectRatio,
//                                 child: VideoPlayer(_controller!),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: _togglePlayPause,
//                               child: Icon(
//                                 _isPlaying ? Icons.pause : Icons.play_arrow,
//                                 size: 100,
//                               ),
//                             ),
//                           ],
//                         )
//                       : const CircularProgressIndicator(),
//               const SizedBox(height: 20),
//               ButtonText(text: 'select video', onPressed: pickVideo),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<File> _videoFiles = [];
  List<VideoPlayerController> _controllers = [];
  List<bool> _isPlayingList = [];

  Future<void> _addVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      setState(() {
        _videoFiles.addAll(result.files.map((file) => File(file.path!)));
        _controllers.addAll(result.files
            .map((file) => VideoPlayerController.file(File(file.path!))
              ..initialize().then((_) {
                setState(() {});
              })));
        _isPlayingList.addAll(List.filled(result.files.length, false));
      });
    } else {
      // User canceled the picker
    }
  }

  void _togglePlayPause(int index) {
    setState(() {
      if (_controllers[index].value.isPlaying) {
        _controllers[index].pause();
        _isPlayingList[index] = false;
      } else {
        _controllers[index].play();
        _isPlayingList[index] = true;
      }
    });
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 20,
          ),
          itemCount: _videoFiles.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _togglePlayPause(index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Material(
                  shadowColor: AppColors.primarycolor,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: AspectRatio(
                            aspectRatio: _controllers[index].value.aspectRatio,
                            child: VideoPlayer(_controllers[index]),
                          ),
                        ),
                        Icon(
                          _isPlayingList[index]
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        onPressed: _addVideo,
        tooltip: 'Add Video',
        child: const Icon(Icons.add),
      ),
    );
  }
}
