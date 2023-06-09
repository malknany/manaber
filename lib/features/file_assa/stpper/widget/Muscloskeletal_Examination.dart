import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class MuscloskeletalExamination extends StatelessWidget {
  MuscloskeletalExamination({super.key});

  final TextEditingController controller1 = TextEditingController();

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
        child: Column(
          children: [
            TextFormFiledStepper(
                labelname: 'Deformities', textEditingController: controller1),
            //From Sitting : (Open text).From Standing : (Open text).

            const DividerItem(text: 'Posture And Alignment'),

            TextFormFiledStepper(
                labelname: 'From Sitting', textEditingController: controller1),
            TextFormFiledStepper(
                labelname: 'From Standing', textEditingController: controller1),
            TextFormFiledStepper(
                labelname: 'Spine', textEditingController: controller1),
            TextFormFiledStepper(
                labelname: 'Pelvic', textEditingController: controller1),
            //normal _ in risk _ sublaxed _ dislocated )
            const DividerItem(text: 'Hip'),
            const DropdownButtonItem(
                lableName: 'Right',
                itemList: ['Normal', 'In risk', 'Sublaxed', 'dislocated']),
            const DropdownButtonItem(
                lableName: 'Left',
                itemList: ['Normal', 'In risk', 'Sublaxed', 'dislocated'])
          ],
        ),
      ),
    );
  }
}
