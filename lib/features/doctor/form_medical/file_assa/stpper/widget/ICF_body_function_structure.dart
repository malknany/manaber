// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/controller.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class ICFBodyfunctionAndstructure extends StatelessWidget {
  const ICFBodyfunctionAndstructure(
      {super.key,
      // required this.controlBodyFunction,
      required this.controleFileAssesment});

  // final StepperControlBodyFunction controlBodyFunction;
  final ControleFileAssesment controleFileAssesment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ICF Body function And Structure'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controleFileAssesment.listicfBody.length,
                itemBuilder: (context, index) {
                  var model = controleFileAssesment.listicfBody[index];
                  if (model is DividerFileAssModel) {
                    return DividerItem(text: model.text);
                  }
                  if (model is DropdownButtonItemModel) {
                    return DropdownButtonItem(
                      controller: model.controller,
                      lableName: model.labelName,
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
                                    if (item is DropdownButtonItemModel) {
                                      return DropdownButtonItem(
                                        controller: item.controller,
                                        lableName: item.labelName,
                                        itemList: item.itemList,
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

// DropdownButtonItem(
            //     controller: controlBodyFunction.mentalStatus,
            //     lableName: 'Mental status',
            //     itemList: const [
            //       'Normal',
            //       'Less than nomal',
            //       'Mental retarted'
            //     ]),
            // TextFormFiledStepper(
            //     labelname: 'Voice Speech',
            //     textEditingController: controlBodyFunction.voiceSpeech),
            // DropdownButtonItem(
            //     controller:
            //         controlBodyFunction.functionOfMetabolicAndEndocrine,
            //     lableName: 'Function of metabolic and endocrine',
            //     itemList: const [
            //       'Normal',
            //       'Less than nomal',
            //       'Malnutrition',
            //       'Obese'
            //     ]),
            // TextFormFiledStepper(
            //     labelname: 'Function of Cardiovascular ',
            //     textEditingController:
            //         controlBodyFunction.functionOfCardiovascularRespiration),
            // const DividerItem(text: 'Sensory Examination'),
            // TextFormFiledStepper(
            //     labelname: 'Superficial',
            //     textEditingController: controlBodyFunction.superficial),
            // TextFormFiledStepper(
            //     labelname: 'Vestibular',
            //     textEditingController: controlBodyFunction.vestibular),
            // TextFormFiledStepper(
            //     labelname: 'Proprioception',
            //     textEditingController: controlBodyFunction.proprioception),
            // TextFormFiledStepper(
            //     labelname: 'Tactile',
            //     textEditingController: controlBodyFunction.tactile),
            // const DividerItem(text: 'GaiT Problems '),
            // TextFormFiledStepper(
            //     labelname: 'Note',
            //     textEditingController: controlBodyFunction.gaitnote),
            // TextFormFiledStepper(
            //     labelname: 'Stance phase',
            //     textEditingController: controlBodyFunction.stancePhase),
            // TextFormFiledStepper(
            //     labelname: 'Swing phase',
            //     textEditingController: controlBodyFunction.swingPhase),
            // const Divider(
            //   color: AppColors.grey,
            //   thickness: 2,
            // ),
            // TextFormFiledStepper(
            //     labelname: 'Balance',
            //     textEditingController: controlBodyFunction.balance),
            // ShowBottomSheetItems(
            //   name: 'Developmental Milestones',
            //   contecnt: SizedBox(
            //     height: MediaQuery.sizeOf(context).height / 1.2,
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: 20, vertical: 10),
            //       child: ListView(
            //         children: [
            //           TextFormFiledStepper(
            //               labelname: 'Head control',
            //               textEditingController:
            //                   controlBodyFunction.headControl),
            //           TextFormFiledStepper(
            //               labelname: 'Rolling',
            //               textEditingController: controlBodyFunction.rolling),
            //           TextFormFiledStepper(
            //               labelname: 'Creeping',
            //               textEditingController:
            //                   controlBodyFunction.creeping),
            //           TextFormFiledStepper(
            //               labelname: 'Crawling',
            //               textEditingController:
            //                   controlBodyFunction.crawling),
            //           TextFormFiledStepper(
            //               labelname: 'Sitting',
            //               textEditingController: controlBodyFunction.sitting),
            //           TextFormFiledStepper(
            //               labelname: 'Standing',
            //               textEditingController:
            //                   controlBodyFunction.standing),
            //           TextFormFiledStepper(
            //               labelname: 'Walking',
            //               textEditingController: controlBodyFunction.walking),
            //           ButtonText(
            //               text: 'Save',
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               }),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // TextFormFiledStepper(
            //     labelname: 'Fine Motor Function (Hand Function) ',
            //     textEditingController:
            //         controlBodyFunction.fineMotorFunctionHandFunction),
