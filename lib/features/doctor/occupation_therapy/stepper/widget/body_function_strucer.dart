import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class BodyFunctionStrucer extends StatelessWidget {
  const BodyFunctionStrucer(
      {super.key, required this.controlerBodyFunctionStrucer});
  final StepperBodyFunctionStrucer controlerBodyFunctionStrucer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Function Strucer'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const DividerItem(text: 'Neuromuscular Status'),
                const DividerItem(text: 'Spastic '),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.spasticUpperLimb,
                    lableName: 'Upper limb',
                    itemList: const [
                      "Right",
                      "Left",
                    ]),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.spasticLowerLimb,
                    lableName: 'Lower limb',
                    itemList: const [
                      "Right",
                      "Left",
                    ]),
                const DividerItem(text: 'Flaccid  '),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.flaccidUpperLimb,
                    lableName: 'Upper limb',
                    itemList: const [
                      "Right",
                      "Left",
                    ]),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.flaccidLowerLimb,
                    lableName: 'Lower limb',
                    itemList: const [
                      "Right",
                      "Left",
                    ]),
                const DividerItem(text: 'Normal '),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.normalUpperLimb,
                    lableName: 'Upper limb',
                    itemList: const [
                      "Right",
                      "Left",
                    ]),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.normalLowerLimb,
                    lableName: 'Lower limb',
                    itemList: const [
                      "Right",
                      "Left",
                    ]),
                const DividerItem(text: 'balance '),
                DropdownButtonItem(
                    controller:
                        controlerBodyFunctionStrucer.sittingBalanceStatic,
                    lableName: 'Sitting Balance Static',
                    itemList: const ["Normal", "Good", "Fair", "Poor"]),
                DropdownButtonItem(
                    controller:
                        controlerBodyFunctionStrucer.sittingBalanceDynamic,
                    lableName: 'Sitting balance  dynamic',
                    itemList: const ["Normal", "Good", "Fair", "Poor"]),
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
              ],
            ),
          )),
    );
  }
}
