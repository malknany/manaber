import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class LevelofSelectivity extends StatelessWidget {
  const LevelofSelectivity(
      {super.key,
      required this.levelofSelectivity,
      required this.controleFileAssesment});
  final List<ModelPatientInfo> levelofSelectivity;
  final ControleFileAssesment controleFileAssesment;

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
            Expanded(
              child: ListView.builder(
                itemCount: controleFileAssesment.listlevelOfSelctivity.length,
                itemBuilder: (context, index) {
                  var model =
                      controleFileAssesment.listlevelOfSelctivity[index];
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
                        hintText: levelofSelectivity[index].answer,
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
                                          hintText:
                                              levelofSelectivity[idx].answer,
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

/*DropdownButtonItem(
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
*/ 