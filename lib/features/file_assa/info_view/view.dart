import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/info_view/widget/activity&activity.dart';
import 'package:manaber/features/file_assa/info_view/widget/goalsview.dart';
import 'package:manaber/features/file_assa/info_view/widget/icf_body.dart';
import 'package:manaber/features/file_assa/info_view/widget/pationt_info_screen.dart';
import 'package:manaber/features/file_assa/stpper/controller.dart';
import 'package:manaber/features/file_assa/stpper/view.dart';
import 'package:manaber/features/profile_pationt/profile_view/view.dart';
// import 'package:manaber/features/file_assa/stpper/widget/ICF_body_function_structure.dart';
// import 'package:manaber/features/file_assa/stpper/widget/Muscloskeletal_Examination.dart';
// import 'package:manaber/features/file_assa/stpper/widget/Participation_And_Participation_Restriction.dart';
// import 'package:manaber/features/file_assa/stpper/widget/goal.dart';
// import 'package:manaber/features/file_assa/stpper/widget/level_of_selctivety.dart';
// import 'package:manaber/features/file_assa/stpper/widget/motor_system.dart';
// import 'package:manaber/features/file_assa/stpper/widget/neurological_examination.dart';
// import 'package:manaber/features/file_assa/stpper/widget/note.dart';
// import 'package:manaber/features/file_assa/stpper/widget/patientInfo.dart';
// import 'package:manaber/features/file_assa/stpper/widget/rom.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class FileAssassemntScreen extends StatelessWidget {
  FileAssassemntScreen({super.key,required this.control});

   final StepperControl control;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(
              context,
               FileStteper(controle: control),
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
                    navigateTo(context,  PatientInfoView(stepperControl:control,));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'ICF Body function And structure',
                  onPressed: () {
                    navigateTo(context, const ICFBodyView());
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'Participation And Participation Restriction',
                  onPressed: () {
                    navigateTo(context, ActivityAndActivityLimitationView());
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'Goals',
                  onPressed: () {
                    navigateTo(context, GoalsView());
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'Note',
                  onPressed: () {
                    navigateTo(context, const ProfilePationtScreen());
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
