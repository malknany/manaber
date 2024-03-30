// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/controller.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/model.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class MusculoskeletalExamination extends StatelessWidget {
  const MusculoskeletalExamination(
      {super.key,
      required this.musculoskeletalExamination,
      required this.controlFileAssessment});

  final List<ModelPatientInfo> musculoskeletalExamination;
  final ControlFileAssessment controlFileAssessment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Musculoskeletal Examination'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controlFileAssessment.listMuscloskelton.length,
                itemBuilder: (context, index) {
                  var model = controlFileAssessment.listMuscloskelton[index];
                  if (model is DividerFileAssModel) {
                    return DividerItem(text: model.text);
                  }
                  if (model is DropdownButtonItemModel) {
                    return DropdownButtonItem(
                      controller: model.controller,
                      labelName: model.labelName,
                      itemList: model.itemList,
                    );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        hintText: musculoskeletalExamination[index].answer,
                        labelName: model.labelName,
                        textEditingController: model.textEditingController);
                  }
                  if (model is BottomSheetFileAssModel) {
                    return ShowBottomSheetItems(
                      name: model.name,
                      content: SizedBox(
                        height: MediaQuery.sizeOf(context).height / 1.2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: model.itemList.length,
                                  itemBuilder: (context, idx) {
                                    final item = model.itemList[idx];
                                    if (item is TextFormFiledStepperModel) {
                                      return TextFormFiledStepper(
                                          hintText:
                                              musculoskeletalExamination[idx]
                                                  .answer,
                                          labelName: item.labelName,
                                          textEditingController:
                                              item.textEditingController);
                                    }
                                    if (item is TextFormFiledRightLiftModel) {
                                      return RightLeftTextFiled(
                                        title: item.labelName,
                                        controllerRight: item.controllerRight,
                                        controllerLeft: item.controllerLeft,
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ),
                              ButtonText(
                                  text: 'Save',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
