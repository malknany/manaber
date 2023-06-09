import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/stpper/view.dart';
import 'package:manaber/features/file_assa/stpper/widget/ICF_body_function_structure.dart';
import 'package:manaber/features/file_assa/stpper/widget/Muscloskeletal_Examination.dart';
import 'package:manaber/features/file_assa/stpper/widget/Participation_And_Participation_Restriction.dart';
import 'package:manaber/features/file_assa/stpper/widget/goal.dart';
import 'package:manaber/features/file_assa/stpper/widget/level_of_selctivety.dart';
import 'package:manaber/features/file_assa/stpper/widget/motor_system.dart';
import 'package:manaber/features/file_assa/stpper/widget/neurological_examination.dart';
import 'package:manaber/features/file_assa/stpper/widget/note.dart';
import 'package:manaber/features/file_assa/stpper/widget/patientInfo.dart';
import 'package:manaber/features/file_assa/stpper/widget/rom.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';

class FileAssassemntScreen extends StatefulWidget {
  const FileAssassemntScreen({super.key});

  @override
  State<FileAssassemntScreen> createState() => _FileAssassemntScreenState();
}

class _FileAssassemntScreenState extends State<FileAssassemntScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // navigateTo(context, const FileStteper());

            navigateAndFinished(
              context,
              PageView(
                children: [
                  PatientInformation(),
                  ICFBodyfunctionAndstructure(),
                  NeurologicalExamination(),
                  MotorSystem(),
                  LevelofSelectivity(),
                  MuscloskeletalExamination(),
                  Activity(),
                  Rom(),
                  Goals(),
                  Note(), 
                ],
              ),
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
              //! somthing wrong in photo
              Image.asset('assets/images/logo.png'),
              const Text(
                "File Assessment",
                style: TextStyle(
                    fontSize: 20,
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
                  onPressed: () {},
                  borderRadius: 7),
              ButtonText(
                  text: 'ICF Body function And structure',
                  onPressed: () {},
                  borderRadius: 7),
              ButtonText(
                  text: '(Participation And Participation Restriction)',
                  onPressed: () {},
                  borderRadius: 7),
              ButtonText(text: 'Goals', onPressed: () {}, borderRadius: 7),
              ButtonText(text: 'Note', onPressed: () {}, borderRadius: 7),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: AppColors.primarycolor,
        backgroundColor: Colors.white,
        // title: const Text(
        //   "File Assessment",
        //   style: TextStyle(
        //       fontSize: 20,
        //       color: Colors.white,
        //       fontFamily: 'Schyler',
        //       fontWeight: FontWeight.bold),
        // ),
        // centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
