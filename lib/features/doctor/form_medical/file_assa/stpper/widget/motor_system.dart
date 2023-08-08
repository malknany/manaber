import 'package:flutter/material.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../controller.dart';
import '../model.dart';

class MotorSystem extends StatelessWidget {
  const MotorSystem(
      {super.key,
      //  required this.controlBodyFunction,
      required this.controleFileAssesment});
  // final StepperControlBodyFunction controlBodyFunction;
  final ControleFileAssesment controleFileAssesment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Motor System'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controleFileAssesment.listMotor.length,
                itemBuilder: (context, index) {
                  var model = controleFileAssesment.listMotor[index];
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

// ShowBottomSheetItems(
            //   name: ' Muscle strength',
            //   contecnt: SizedBox(
            //     height: MediaQuery.sizeOf(context).height / 1.2,
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //       child: ListView(
            //         children: [
            //           const DividerItem(text: 'Muscle strength'),
            //           RightLeftTextFiled(
            //               title: 'Gluteal',
            //               controllerRight: controlBodyFunction.glutealRight,
            //               controllerLeft: controlBodyFunction.glutealLeft),
            //           RightLeftTextFiled(
            //               title: 'Abductors',
            //               controllerRight: controlBodyFunction.abductorsRight,
            //               controllerLeft: controlBodyFunction.abductorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Adductor',
            //               controllerRight: controlBodyFunction.adductorsRight,
            //               controllerLeft: controlBodyFunction.adductorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Hip flexors',
            //               controllerRight: controlBodyFunction.hipFlexorsRight,
            //               controllerLeft: controlBodyFunction.hipFlexorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Hip IR',
            //               controllerRight: controlBodyFunction.hipIRRight,
            //               controllerLeft: controlBodyFunction.hipIRLeft),
            //           RightLeftTextFiled(
            //               title: 'Hip ER',
            //               controllerRight: controlBodyFunction.hipERRight,
            //               controllerLeft: controlBodyFunction.hipERLeft),
            //           RightLeftTextFiled(
            //               title: 'Quadriceps',
            //               controllerRight: controlBodyFunction.quadricepsRight,
            //               controllerLeft: controlBodyFunction.quadricepsLeft),
            //           RightLeftTextFiled(
            //               title: 'Hamstring',
            //               controllerRight: controlBodyFunction.hamstringRight,
            //               controllerLeft: controlBodyFunction.hamstringLeft),
            //           RightLeftTextFiled(
            //               title: 'Plantar flexors',
            //               controllerRight:
            //                   controlBodyFunction.plantarFlexorsRight,
            //               controllerLeft:
            //                   controlBodyFunction.plantarFlexorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Dorsiflexors',
            //               controllerRight:
            //                   controlBodyFunction.dorsiflexorsRight,
            //               controllerLeft: controlBodyFunction.dorsiflexorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Shoulder flexors',
            //               controllerRight:
            //                   controlBodyFunction.shoulderFlexorsRight,
            //               controllerLeft:
            //                   controlBodyFunction.shoulderFlexorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Shoulder Extensors',
            //               controllerRight:
            //                   controlBodyFunction.shoulderExtensorsRight,
            //               controllerLeft:
            //                   controlBodyFunction.shoulderExtensorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Shoulder',
            //               controllerRight: controlBodyFunction.shoulderRight,
            //               controllerLeft: controlBodyFunction.shoulderLeft),
            //           RightLeftTextFiled(
            //               title: 'Shoulder IR',
            //               controllerRight: controlBodyFunction.shoulderIRRight,
            //               controllerLeft: controlBodyFunction.shoulderIRLeft),
            //           RightLeftTextFiled(
            //               title: 'Shoulder ER',
            //               controllerRight: controlBodyFunction.shoulderERRight,
            //               controllerLeft: controlBodyFunction.shoulderERLeft),
            //           RightLeftTextFiled(
            //               title: 'Elbow Flexors',
            //               controllerRight:
            //                   controlBodyFunction.elbowFlexorsRight,
            //               controllerLeft: controlBodyFunction.elbowFlexorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Elbow Extensors',
            //               controllerRight:
            //                   controlBodyFunction.elbowExtensorsRight,
            //               controllerLeft:
            //                   controlBodyFunction.elbowExtensorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Wrist Flexors',
            //               controllerRight:
            //                   controlBodyFunction.wristFlexorsRight,
            //               controllerLeft: controlBodyFunction.wristFlexorsLeft),
            //           RightLeftTextFiled(
            //               title: 'Wrist Extensors',
            //               controllerRight:
            //                   controlBodyFunction.wristExtensorsRight,
            //               controllerLeft:
            //                   controlBodyFunction.wristExtensorsLeft),
            //           ButtonText(
            //               text: 'Save',
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               })
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // TextFormFiledStepper(
            //     labelname: 'Muscle Tone',
            //     textEditingController: controlBodyFunction.muscleTon),
            // ShowBottomSheetItems(
            //   name: ' Muscle Tone',
            //   contecnt: SizedBox(
            //     height: MediaQuery.sizeOf(context).height / 1.2,
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //       child: SingleChildScrollView(
            //         child: Column(
            //           children: [
            //             const DividerItem(text: 'Muscle Tone '),
            //             RightLeftTextFiled(
            //                 title: 'Adductors (Knee flexion)',
            //                 controllerRight: controlBodyFunction
            //                     .adductorsKneeFlexionTonRight,
            //                 controllerLeft: controlBodyFunction
            //                     .adductorsKneeFlexionTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Adductors (Knee Extension)',
            //                 controllerRight: controlBodyFunction
            //                     .adductorsKneeExtensionTonRight,
            //                 controllerLeft: controlBodyFunction
            //                     .adductorsKneeExtensionTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Illiospoas',
            //                 controllerRight:
            //                     controlBodyFunction.illiospoasTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.illiospoasTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Hip IR',
            //                 controllerRight:
            //                     controlBodyFunction.hipIRtonTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.hipIRtonTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Hip ER',
            //                 controllerRight:
            //                     controlBodyFunction.hipERtonTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.hipERtonTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Quadriceps',
            //                 controllerRight:
            //                     controlBodyFunction.quadricepsTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.quadricepsTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Hamstring',
            //                 controllerRight:
            //                     controlBodyFunction.hamstringTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.hamstringTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Gastrocnemius',
            //                 controllerRight:
            //                     controlBodyFunction.gastrocnemiusTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.gastrocnemiusTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Soleus',
            //                 controllerRight: controlBodyFunction.soleusTonRight,
            //                 controllerLeft: controlBodyFunction.soleusTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Tibialis Ant',
            //                 controllerRight:
            //                     controlBodyFunction.tibialisAntTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.tibialisAntTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Tibialis Post',
            //                 controllerRight:
            //                     controlBodyFunction.tibialisPostTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.tibialisPostTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Shoulder',
            //                 controllerRight:
            //                     controlBodyFunction.shoulderTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.shoulderTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Adductors',
            //                 controllerRight:
            //                     controlBodyFunction.adductorsTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.adductorsTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Shoulder ER',
            //                 controllerRight:
            //                     controlBodyFunction.shoulderERTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.shoulderERTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Shoulder IR',
            //                 controllerRight:
            //                     controlBodyFunction.shoulderIRTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.shoulderIRTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Elbow Flexors',
            //                 controllerRight:
            //                     controlBodyFunction.elbowFlexorsTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.elbowFlexorsTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Wrist Flexors',
            //                 controllerRight:
            //                     controlBodyFunction.wristFlexorsTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.wristFlexorsTonLeft),
            //             RightLeftTextFiled(
            //                 title: 'Finger Flexors',
            //                 controllerRight:
            //                     controlBodyFunction.fingerFlexorsTonRight,
            //                 controllerLeft:
            //                     controlBodyFunction.fingerFlexorsTonLeft),
            //             ButtonText(
            //                 text: 'Save',
            //                 onPressed: () {
            //                   Navigator.pop(context);
            //                 })
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // DropdownButtonItem(
            //     controller: controlBodyFunction.muscleBulk,
            //     lableName: 'Muscle Bulk',
            //     itemList: const [
            //       'Atrophy',
            //       'Less than normal',
            //       'Normal',
            //       'speudo trophy'
            //     ])