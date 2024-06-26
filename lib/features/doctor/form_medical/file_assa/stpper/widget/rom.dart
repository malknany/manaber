import 'package:flutter/material.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../model.dart';
import '../controller.dart';
import '../model.dart';

class Rom extends StatelessWidget {
  const Rom(
      {super.key, required this.rom, required this.controlFileAssessment});

  final ControlFileAssessment controlFileAssessment;
  final List<ModelPatientInfo> rom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Rom'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controlFileAssessment.listRom.length,
                itemBuilder: (context, index) {
                  var model = controlFileAssessment.listRom[index];
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
                        hintText: rom[index].answer,
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
