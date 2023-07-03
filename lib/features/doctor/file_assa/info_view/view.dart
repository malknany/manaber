import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/info_view/widget/activity&activity.dart';
import 'package:manaber/features/doctor/file_assa/info_view/widget/goalsview.dart';
import 'package:manaber/features/doctor/file_assa/info_view/widget/icf_body.dart';
import 'package:manaber/features/doctor/file_assa/info_view/widget/noteview.dart';
import 'package:manaber/features/doctor/file_assa/info_view/widget/pationt_info_screen.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/features/doctor/file_assa/stpper/view.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class FileAssassemntScreen extends StatelessWidget {
  const FileAssassemntScreen(
      {super.key,
      required this.control,
      required this.controlBodyFunction,
      required this.controlGoalsAndNote,
      required this.controlActivityAndActivityLimitation});

  final StepperControlPatientInfo control;
  final StepperControlBodyFunction controlBodyFunction;
  final StepperControlGoalsAndNote controlGoalsAndNote;
  final StepperControlActivityAndActivityLimitation
      controlActivityAndActivityLimitation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(
              context,
              FileStteper(
                  controle: control,
                  controlBodyFunction: controlBodyFunction,
                  controlActivityAndActivityLimitation:
                      controlActivityAndActivityLimitation,
                  controlGoalsAndNote: controlGoalsAndNote),
            );
          },
          backgroundColor: AppColors.primarycolor,
          elevation: 0,
          child: const Icon(Icons.edit_outlined)),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Image.asset(AppImages.fileAssessment)),
              const Text(
                "File Assessment",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "All information about Patient",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.normal),
              ),
              ButtonText(
                  text: 'Patient Information',
                  onPressed: () {
                    navigateTo(
                        context,
                        PatientInfoView(
                          stepperControl: control,
                        ));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'ICF Body function And structure',
                  onPressed: () {
                    navigateTo(
                        context,
                        ICFBodyView(
                          controlBodyFunction: controlBodyFunction,
                        ));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'Participation',
                  onPressed: () {
                    navigateTo(
                        context,
                        ActivityAndActivityLimitationView(
                          controlActivityAndActivityLimitation:
                              controlActivityAndActivityLimitation,
                        ));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'Goals',
                  onPressed: () {
                    navigateTo(
                        context,
                        GoalsView(
                          controlGoalsAndNote: controlGoalsAndNote,
                        ));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'Note',
                  onPressed: () {
                    navigateTo(
                        context,
                        NoteView(
                          controlGoalsAndNote: controlGoalsAndNote,
                        ));
                  },
                  borderRadius: 7),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: AppColors.primarycolor,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
