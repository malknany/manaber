import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/keep_alive.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'controller.dart';
import 'widget/ICF_body_function_structure.dart';
import 'widget/Muscloskeletal_Examination.dart';
import 'widget/Participation_And_Participation_Restriction.dart';
import 'widget/goal.dart';
import 'widget/level_of_selctivety.dart';
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
      required this.controleFileAssesment,
      required this.id})
      : super(key: key);

  final ControleFileAssesment controleFileAssesment;
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
    final List<ModelPatientInfo> levelofSelectivity = [];
    final List<ModelPatientInfo> muscloskeletalExamination = [];
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
        levelofSelectivity.add(person);
      }
      if (person.section == 'Muscloskeletal Examination') {
        muscloskeletalExamination.add(person);
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
                      controleFileAssesment: controleFileAssesment),
                ),
                KeepAliveScreen(
                  page: ICFBodyfunctionAndstructure(
                    iCFBodyfunction: iCFBodyFunction,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                KeepAliveScreen(
                  page: NeurologicalExamination(
                    neurologicalExamination: neurologicalExamination,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                KeepAliveScreen(
                  page: MotorSystem(
                    motor: motor,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                KeepAliveScreen(
                  page: LevelofSelectivity(
                    levelofSelectivity: levelofSelectivity,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                KeepAliveScreen(
                  page: MuscloskeletalExamination(
                    muscloskeletalExamination: muscloskeletalExamination,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                KeepAliveScreen(
                  page: Rom(
                    rom: rom,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                KeepAliveScreen(
                  page: Activity(
                    activity: activity,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                KeepAliveScreen(
                  page: Goals(
                    goals: goals,
                    controleFileAssesment: controleFileAssesment,
                  ),
                ),
                BlocProvider(
                  create: (context) => PateintInfoCubit(),
                  child: KeepAliveScreen(
                    page: Note(
                      note: note,
                      id: id,
                      controleFileAssesment: controleFileAssesment,
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
                  backgroundColor: AppColors.primarycolor,
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
                  backgroundColor: AppColors.primarycolor,
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
