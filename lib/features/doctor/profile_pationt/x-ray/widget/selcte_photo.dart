import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/controle.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class SlectePhotoView extends StatefulWidget {
  const SlectePhotoView({super.key,required this.controle});
  final ControleXray controle;

  @override
  State<SlectePhotoView> createState() => _SlectePhotoViewState();
}

class _SlectePhotoViewState extends State<SlectePhotoView> {
    List<File> _images = [];
  final TextEditingController editingController = TextEditingController();

  Future pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _images = result.paths.map((path) => File(path!)).toList();
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            final model =
                ModelXray(title: editingController.text, images: _images);
            widget.controle.itemes.add(model);
            Navigator.pop(context, 'refresh');
          },
          backgroundColor: AppColors.primarycolor),
      appBar: AppBar(
        title: Text('Gallery Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormFiledStepper(
                textEditingController: editingController, labelname: 'report'),
            _images.isNotEmpty
                ? SizedBox.shrink()
                : ButtonText(
                    text: 'Selcte photo',
                    onPressed: pickImages,
                  ),
            _images.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(
                          _images[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  )
                : SizedBox.fromSize(),
          ],
        ),
      ),
    );
  }
}