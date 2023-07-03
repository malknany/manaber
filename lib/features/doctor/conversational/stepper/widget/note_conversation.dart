import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';

import 'package:manaber/shared/styles/colors.dart';

class NoteConversation extends StatelessWidget {
  const NoteConversation({super.key, required this.controleNoteConversation});
  final StepperNoteConversation controleNoteConversation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملاحظات'),
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
              textDirection:  TextDirection.rtl,
              children: [
                TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                    labelname: 'المعززات ',
                    textEditingController:
                        controleNoteConversation.reinforcers),
                TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                    labelname: 'الاھداف المبدئیة ',
                    textEditingController:
                        controleNoteConversation.initialGoals),
                TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                    labelname: 'ملاحظات ',
                    textEditingController: controleNoteConversation.note),
                ButtonText(text: "حفظ", onPressed: () {})
              ],
            ),
          )),
    );
  }
}
