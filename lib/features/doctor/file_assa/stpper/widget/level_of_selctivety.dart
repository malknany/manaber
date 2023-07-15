import 'package:flutter/material.dart';
import '../controller.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class LevelofSelectivity extends StatelessWidget {
  const LevelofSelectivity({super.key, required this.controlBodyFunction});
  final StepperControlBodyFunction controlBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Level of Selectivity'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            DropdownButtonItem(
                controller: controlBodyFunction.upperLimb,
                lableName: 'Upper limb',
                itemList: const ['No', 'Poor', 'Moderate', 'Normal']),
            DropdownButtonItem(
                controller: controlBodyFunction.lowerLimb,
                lableName: 'Lower limb ',
                itemList: const ['No', 'Poor', 'Moderate', 'Normal']),
            // !
            ShowBottomSheetItems(
              name: ' Muscle ',
              contecnt: SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const DividerItem(text: 'Muscle'),
                        RightLeftTextFiled(
                            title: 'Gluteal',
                            controllerRight:
                                controlBodyFunction.glutealMuscleRight,
                            controllerLeft:
                                controlBodyFunction.glutealMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Abductors',
                            controllerRight:
                                controlBodyFunction.abductorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.abductorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Addoctors',
                            controllerRight:
                                controlBodyFunction.adductorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.adductorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Hip flexors',
                            controllerRight:
                                controlBodyFunction.hipFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.hipFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Quadriceps',
                            controllerRight:
                                controlBodyFunction.quadricepsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.quadricepsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Hamstring',
                            controllerRight:
                                controlBodyFunction.hamstringMuscleRight,
                            controllerLeft:
                                controlBodyFunction.hamstringMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Planter flexors',
                            controllerRight:
                                controlBodyFunction.planterFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.planterFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Dorsiflexors',
                            controllerRight:
                                controlBodyFunction.dorsiflexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.dorsiflexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Shoulder flexors',
                            controllerRight:
                                controlBodyFunction.shoulderFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.shoulderFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Shoulder Extensors',
                            controllerRight: controlBodyFunction
                                .shoulderExtensorsMuscleRight,
                            controllerLeft: controlBodyFunction
                                .shoulderExtensorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Shoulder Abductors',
                            controllerRight: controlBodyFunction
                                .shoulderAbductorsMuscleRight,
                            controllerLeft: controlBodyFunction
                                .shoulderAbductorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Elbow Flexors',
                            controllerRight:
                                controlBodyFunction.elbowFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.elbowFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Elbow Extensors',
                            controllerRight:
                                controlBodyFunction.elbowExtensorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.elbowExtensorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Wrist Flexors',
                            controllerRight:
                                controlBodyFunction.wristFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.wristFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Wrist Extensors',
                            controllerRight:
                                controlBodyFunction.wristExtensorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.wristExtensorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Finger Flexors',
                            controllerRight:
                                controlBodyFunction.fingerFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.fingerFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Finger Extensors',
                            controllerRight:
                                controlBodyFunction.fingerExtensorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.fingerExtensorsMuscleLeft),
                        ButtonText(
                            text: 'Save',
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
