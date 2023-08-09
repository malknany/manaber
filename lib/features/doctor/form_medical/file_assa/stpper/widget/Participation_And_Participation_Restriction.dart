// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/model.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../controller.dart';

//ctivity&Activity Limitation&(Participation AndParticipation Restriction
class Activity extends StatelessWidget {
  const Activity(
      {super.key,
      // required this.controlActivityAndActivityLimitation,
      required this.controleFileAssesment});

  // final StepperControlActivityAndActivityLimitation
  //     controlActivityAndActivityLimitation;
  final ControleFileAssesment controleFileAssesment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Activity'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
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
                itemCount: controleFileAssesment.listParticipation.length,
                itemBuilder: (context, index) {
                  var model = controleFileAssesment.listParticipation[index];
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
                        labelname: model.labelName,
                        textEditingController: model.textEditingController);
                  }
                  if (model is BottomSheetFileAssModel) {
                    return ShowBottomSheetItems(
                      name: model.name,
                      contecnt: SizedBox(
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
                                          labelname: item.labelName,
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
