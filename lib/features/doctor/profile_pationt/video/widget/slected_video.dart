import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../controle.dart';
import '../model.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class SlectedVideo extends StatefulWidget {
  const SlectedVideo({super.key, required this.controleViedoes});
  final ControleViedoes? controleViedoes;
  @override
  State<SlectedVideo> createState() => _SlectedVideoState();
}

class _SlectedVideoState extends State<SlectedVideo> {
  final TextEditingController _controller = TextEditingController();

  bool isSlected = false;

  Future<void> _addVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      setState(() {
        final file = result.files.first;
        final model = ModelVideoes(
          tilte: _controller.text,
          videoFiles: file.path!,
        );
        widget.controleViedoes!.listOfViedoes.add(model);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primarycolor,
          child: const Icon(
            Icons.save_alt_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, 'refresh');
          }),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFiledStepper(
                  textEditingController: _controller, labelname: 'Title'),
              isSlected
                  ? const CircleAvatar(
                      backgroundColor: AppColors.primarycolor,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    )
                  : ButtonText(
                      text: 'اختار فديو',
                      onPressed: () {
                        _addVideo().then((value) {
                          setState(() {
                            isSlected = true;
                          });
                        });
                      })
            ],
          ),
        ),
      ),
    );
  }
}
