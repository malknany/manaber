import 'package:flutter/material.dart';

import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';

import 'package:manaber/shared/styles/colors.dart';

class NoteOccupation extends StatelessWidget {
  const NoteOccupation({
    super.key,
    required this.controlerOccupationPreformance,
  });
  final StepperOccupationPreformance controlerOccupationPreformance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
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
                TextFormFiledStepper(
                    labelname: 'Note ',
                    textEditingController: controlerOccupationPreformance.note),
                ButtonText(
                    text: "Save",
                    onPressed: () {
                      Navigator.pop(context, 'refresh');
                    })
              ],
            ),
          )),
    );
  }
}
