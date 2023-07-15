import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../controle.dart';
import '../model.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class SlectePhotoView extends StatefulWidget {
  const SlectePhotoView({super.key, required this.controle});
  final ControleXray controle;

  @override
  State<SlectePhotoView> createState() => _SlectePhotoViewState();
}

class _SlectePhotoViewState extends State<SlectePhotoView> {
  List<File> _images = [];
  bool isDeleted = false;

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
          onPressed: () {
            final model = ModelXray(images: _images);
            widget.controle.itemes.add(model);
            Navigator.pop(context, 'refresh');
          },
          backgroundColor: AppColors.primarycolor,
          child: const Icon(Icons.save_alt)),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDeleted = !isDeleted;
              });
            },
            icon: const Icon(
              Icons.delete,
            ),
          )
        ],
        title: const Text('Gallery Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _images.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Image.file(
                              _images[index],
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppColors.primarycolor,
                                  child: const Center(
                                    child: Text(
                                      'Error load image',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            isDeleted
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _images.removeAt(index);
                                          isDeleted = !isDeleted;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        );
                      },
                    ),
                  )
                : ButtonText(
                    text: 'Selcte photo',
                    onPressed: pickImages,
                  ),
            // _images.isNotEmpty
            //     ? Expanded(
            //         child: GridView.builder(
            //           gridDelegate:
            //               const SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             crossAxisSpacing: 4,
            //             mainAxisSpacing: 4,
            //           ),
            //           itemCount: _images.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return InkWell(
            //               onLongPress: (){
            //                 showMenu(context: context, position: const RelativeRect.fromLTRB(0, 0, 0, 0), items: []);
            //               },
            //               child: Image.file(
            //                 _images[index],
            //                 fit: BoxFit.fill,
            //               ),
            //             );
            //           },
            //         ),
            //       )
            //     : SizedBox.fromSize(),
          ],
        ),
      ),
    );
  }
}
