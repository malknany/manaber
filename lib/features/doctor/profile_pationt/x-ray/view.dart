import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/controle.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/model.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/widget/data_view_entry.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/styles.dart';

class XrayView extends StatefulWidget {
  XrayView({
    super.key,
  });
  final ControleXray controle = ControleXray();

  @override
  State<XrayView> createState() => _XrayViewState();
}

class _XrayViewState extends State<XrayView> {
  List<File> _images = [];
  // final TextEditingController editingController = TextEditingController();
  bool isRefresh = false;
  bool isDelete = false;
  Future pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _images = result.paths.map((path) => File(path!)).toList();
        final model = ModelXray(images: _images);
        widget.controle.itemes.add(model);
        isRefresh = true;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDelete = !isDelete;
                });
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.primarycolor,
              ))
        ],
        title: const Text('X-ray'),
        backgroundColor: Colors.white,
      ),
      body: isRefresh
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 20,
                ),
                itemCount: widget.controle.itemes.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateTo(
                            context,
                            XrayDataView(
                              modelXray: widget.controle.itemes[index],
                            ));
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
                            height: MediaQuery.sizeOf(context).height / 4,
                            width: MediaQueryHelper.sizeFromWidth(context, 1.2),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "X_ray${index + 1}",
                                      style: AppTextStyles.lrTitles.copyWith(
                                          color: AppColors.primarycolor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    isDelete
                        ? Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.controle.itemes.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            )
          : const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text("No X-ray",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: pickImages,
        // () async {

        // final refresh = await navigateTo(
        //     context, SlectePhotoView(controle: widget.controle));

        // if (refresh == 'refresh') {
        //   setState(() {
        //     isRefresh = true;
        //   });
        // }
        // },
      ),
    );
  }
}
