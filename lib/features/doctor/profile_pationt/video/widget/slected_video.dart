import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/video/controle.dart';
import 'package:manaber/features/doctor/profile_pationt/video/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:video_player/video_player.dart';

class SlectedVideo extends StatefulWidget {
  SlectedVideo({super.key, required this.controleViedoes});
  final ControleViedoes? controleViedoes;
  @override
  State<SlectedVideo> createState() => _SlectedVideoState();
}

class _SlectedVideoState extends State<SlectedVideo> {
  final List<File> _videoFiles = [];
  final List<VideoPlayerController> _controllers = [];
  final List<bool> _isPlayingList = [];
  final TextEditingController _controller = TextEditingController();

  final bool isSlected = false;

  Future<void> _addVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      setState(() {
        final model = ModelVideoes(
          tilte: _controller.text,
            videoFiles: _videoFiles,
            controllers: _controllers,
            isPlayingList: _isPlayingList);
        _videoFiles.addAll(result.files.map((file) => File(file.path!)));
        _controllers.addAll(result.files
            .map((file) => VideoPlayerController.file(File(file.path!))
              ..initialize().then((_) {
                setState(() {});
              })));
        _isPlayingList.addAll(List.filled(result.files.length, false));
        widget.controleViedoes!.listOfViedoes.add(model);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            TextFormFiledStepper(
                textEditingController: _controller, labelname: 'Title'),
            isSlected
                ? const Icon(
                    Icons.check,
                    color: AppColors.primarycolor,
                  )
                : ButtonText(text: 'Title', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
