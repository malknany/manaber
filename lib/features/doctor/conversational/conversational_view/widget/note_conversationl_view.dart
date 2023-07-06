import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class NoteConversationalView extends StatelessWidget {
  const NoteConversationalView(
      {super.key, required this.controleNoteConversation});
  final StepperNoteConversation controleNoteConversation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.primarycolor,
      //   elevation: 0,
      //   child: const Icon(Icons.edit_outlined),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ملاحظات',
          style: TextStyle(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.conversational)),
                const SizedBox(height: 16.0),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "المعززات",
                    value: controleNoteConversation.reinforcers.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "الاھداف المبدئیة",
                    value: controleNoteConversation.initialGoals.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ملاحظات",
                    value: controleNoteConversation.note.text),
              ],
            ),
          )),
    );
  }
}
