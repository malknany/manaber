import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class BodyFunctionStrucer extends StatelessWidget {
  const BodyFunctionStrucer(
      {super.key,
      required this.controlOccupation,
      required this.bodyFunctionStrucer});
  final ControlOccupation controlOccupation;
  final List<ModelPatientInfo> bodyFunctionStrucer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Function Strucer'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView(
            children: List.generate(bodyFunctionStrucer.length, (index) {
              var model =
                  controlOccupation.listOfBodyFunctionStrucer[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  labelName: model.labelName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    hintText: bodyFunctionStrucer[index].answer,
                    textInputType: model.textInputType,
                    labelName: model.labelname,
                    textEditingController: model.textEditingController);
              }
              if (model is ModelDividerOccupation) {
                return DividerItem(text: model.text);
              }

              return const SizedBox.shrink();
            }),
          )),
    );
  }
}

/*
const DividerItem(text: 'Neuromuscular Status'),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer
                        .neuromuscularStatusUpperLimb,
                    lableName: 'Upper limb',
                    itemList: const [
                      "Spastic",
                      "Flaccid",
                      "Normal",
                    ]),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer
                        .neuromuscularStatusLowerLimb,
                    lableName: 'Lower limb',
                    itemList: const [
                      "Spastic",
                      "Flaccid",
                      "Normal",
                    ]),
                TextFormFiledStepper(
                    labelname: 'Note',
                    textEditingController:
                        controlerBodyFunctionStrucer.neuromuscularStatusNote),
                const DividerItem(text: 'balance '),
                TextFormFiledStepper(
                    labelname: 'Sitting Balance Static',
                    textEditingController:
                        controlerBodyFunctionStrucer.sittingBalanceStatic),
                TextFormFiledStepper(
                    labelname: 'Sitting balance dynamic',
                    textEditingController:
                        controlerBodyFunctionStrucer.sittingBalanceDynamic),
                TextFormFiledStepper(
                    labelname: 'Posture',
                    textEditingController:
                        controlerBodyFunctionStrucer.posture),
                TextFormFiledStepper(
                    labelname: 'Gait ',
                    textEditingController: controlerBodyFunctionStrucer.gait),
                TextFormFiledStepper(
                    labelname: 'Deformities',
                    textEditingController:
                        controlerBodyFunctionStrucer.deformities),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.musclebulk,
                    lableName: 'Muscle bulk',
                    itemList: const [
                      "Normal",
                      "atrophy",
                      "less than normal",
                      "speudo trophy"
                    ]),
                TextFormFiledStepper(
                    labelname: 'Leg Length Discrepancy ',
                    textEditingController:
                        controlerBodyFunctionStrucer.legLengthDiscrepancy),
                TextFormFiledStepper(
                    labelname: 'Skin Condition',
                    textEditingController:
                        controlerBodyFunctionStrucer.skinCondition),
                TextFormFiledStepper(
                    labelname: 'Assistive Devices',
                    textEditingController:
                        controlerBodyFunctionStrucer.assistiveDevices),
*/ 
