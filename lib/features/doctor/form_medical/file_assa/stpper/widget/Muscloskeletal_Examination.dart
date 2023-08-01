// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class MuscloskeletalExamination extends StatelessWidget {
  MuscloskeletalExamination({super.key, required this.controlBodyFunction});

  final TextEditingController controller1 = TextEditingController();
  final StepperControlBodyFunction controlBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Muscloskeletal Examination'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: ListView(
          children: [
            TextFormFiledStepper(
                labelname: 'Deformities',
                textEditingController: controlBodyFunction.deformities),
            const DividerItem(text: 'Posture And Alignment'),
            TextFormFiledStepper(
                labelname: 'From Sitting',
                textEditingController: controlBodyFunction.fromSitting),
            TextFormFiledStepper(
                labelname: 'From Standing',
                textEditingController: controlBodyFunction.fromStanding),
            TextFormFiledStepper(
                labelname: 'Spine',
                textEditingController: controlBodyFunction.spine),
            TextFormFiledStepper(
                labelname: 'Pelvic',
                textEditingController: controlBodyFunction.pelvic),
                TextFormFiledStepper(
                  labelname: 'Leg Length Discrepancy ',
                  textEditingController:
                      controlBodyFunction.legLengthDiscrepancy),
            const DividerItem(text: 'Hip'),
            DropdownButtonItem(
                controller: controlBodyFunction.rt,
                lableName: 'Right',
                itemList: const ['Normal', 'In risk', 'Sublaxed', 'dislocated']),
            DropdownButtonItem(
                controller: controlBodyFunction.lf,
                lableName: 'Left',
                itemList: const ['Normal', 'In risk', 'Sublaxed', 'dislocated'])
          ],
        ),
      ),
    );
  }
}
