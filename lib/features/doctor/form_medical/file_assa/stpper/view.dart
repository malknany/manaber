import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/widget/level_of_selctivety.dart';
import '../../cubit/pateint_info_cubit.dart';
import '../../keep_alive.dart';
import '../../model.dart';
import 'controller.dart';
import 'widget/ICF_body_function_structure.dart';
import 'widget/Muscloskeletal_Examination.dart';
import 'widget/Participation_And_Participation_Restriction.dart';
import 'widget/goal.dart';
import 'widget/motor_system.dart';
import 'widget/neurological_examination.dart';
import 'widget/note.dart';
import 'widget/patientInfo.dart';
import 'widget/rom.dart';
import '../../../../../shared/styles/colors.dart';

class FileStteper extends StatelessWidget {
  FileStteper(
      {Key? key,
      required this.listOfInfoFileAssessment,
      required this.controlFileAssessment,
      required this.id})
      : super(key: key);

  final ControlFileAssessment controlFileAssessment;
  final String id;
  final List<ModelPatientInfo> listOfInfoFileAssessment;

  final PageController _pageController = PageController();

  void _navigateToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _navigateToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<ModelPatientInfo> personalHistory = [];
    final List<ModelPatientInfo> iCFBodyFunction = [];
    final List<ModelPatientInfo> neurologicalExamination = [];
    final List<ModelPatientInfo> motor = [];
    final List<ModelPatientInfo> rom = [];
    final List<ModelPatientInfo> levelOfSelectivity = [];
    final List<ModelPatientInfo> musculoskeletalExamination = [];
    final List<ModelPatientInfo> activity = [];
    final List<ModelPatientInfo> goals = [];
    final List<ModelPatientInfo> note = [];
    /*
          person.section == 'Level of Selectivity' ||
          person.section == 'Muscloskeletal Examination'
    */
    for (final person in listOfInfoFileAssessment) {
      if (person.section == 'Patient Information') {
        personalHistory.add(person);
      }
      if (person.section == 'ICF Body Function and Structure') {
        iCFBodyFunction.add(person);
      }
      if (person.section == 'Neurological Examination') {
        neurologicalExamination.add(person);
      }
      if (person.section == 'Motor System') {
        motor.add(person);
      }
      if (person.section == 'Rom') {
        rom.add(person);
      }
      if (person.section == 'Level of Selectivity') {
        levelOfSelectivity.add(person);
      }
      if (person.section == 'Muscloskeletal Examination') {
        musculoskeletalExamination.add(person);
      }
      if (person.section == 'Activity') {
        activity.add(person);
      }
      if (person.section == 'Goals') {
        goals.add(person);
      }

      if (person.section == 'Note') {
        note.add(person);
      }
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                KeepAliveScreen(
                  page: PatientInformation(
                      patientInformation: personalHistory,
                      controlFileAssessment: controlFileAssessment),
                ),
                KeepAliveScreen(
                  page: ICFBodyFunctionAndstructure(
                    iCFBodyFunction: iCFBodyFunction,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                KeepAliveScreen(
                  page: NeurologicalExamination(
                    neurologicalExamination: neurologicalExamination,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                KeepAliveScreen(
                  page: MotorSystem(
                    motor: motor,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                KeepAliveScreen(
                  page: LevelOfSelectivity(
                    levelOfSelectivity: levelOfSelectivity,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                KeepAliveScreen(
                  page: MusculoskeletalExamination(
                    musculoskeletalExamination: musculoskeletalExamination,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                KeepAliveScreen(
                  page: Rom(
                    rom: rom,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                KeepAliveScreen(
                  page: Activity(
                    activity: activity,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                KeepAliveScreen(
                  page: Goals(
                    goals: goals,
                    controlFileAssessment: controlFileAssessment,
                  ),
                ),
                BlocProvider(
                  create: (context) => PatientInfoCubit(),
                  child: KeepAliveScreen(
                    page: Note(
                      note: note,
                      id: id,
                      controlFileAssessment: controlFileAssessment,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  _navigateToPreviousPage();
                },
                child:
                    const Text('Back', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  _navigateToNextPage();
                },
                child:
                    const Text('Next', style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
