import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/info_view/view.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class Note extends StatelessWidget {
  const Note({super.key, required this.control, required this.controlBodyFunction,required this.controlGoalsAndNote,required this.controlActivityAndActivityLimitation});

  final StepperControlPatientInfo control;
  final StepperControlBodyFunction controlBodyFunction;
  final StepperControlGoalsAndNote controlGoalsAndNote;
  final StepperControlActivityAndActivityLimitation controlActivityAndActivityLimitation ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  labelname: 'Note', textEditingController: controlGoalsAndNote.note),
              ButtonText(
                  text: 'Save',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FileAssassemntScreen(
                        controlActivityAndActivityLimitation: controlActivityAndActivityLimitation,
                        controlGoalsAndNote: controlGoalsAndNote,
                          control: control,
                          controlBodyFunction: controlBodyFunction),
                    ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
