import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
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
      // required this.controle,
      // required this.controlBodyFunction,
      // required this.controlActivityAndActivityLimitation,
      // required this.controlGoalsAndNote,
      required this.controleFileAssesment,
      required this.id})
      : super(key: key);
  // final StepperControlPatientInfo controle;
  // final StepperControlBodyFunction controlBodyFunction;
  // final StepperControlGoalsAndNote controlGoalsAndNote;
  // final StepperControlActivityAndActivityLimitation
  //     controlActivityAndActivityLimitation;

  final ControleFileAssesment controleFileAssesment;
  final String id;

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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                PatientInformation(
                    // stepperControl: controle,
                    controleFileAssesment: controleFileAssesment),
                ICFBodyfunctionAndstructure(
                  controleFileAssesment: controleFileAssesment,
                  // controlBodyFunction: controlBodyFunction
                ),
                NeurologicalExamination(
                  controleFileAssesment: controleFileAssesment,
                  // controlBodyFunction: controlBodyFunction
                ),
                MotorSystem(
                  controleFileAssesment: controleFileAssesment,
                  // controlBodyFunction: controlBodyFunction
                ),
                LevelofSelectivity(
                  controleFileAssesment: controleFileAssesment,
                  // controlBodyFunction: controlBodyFunction
                ),
                MuscloskeletalExamination(
                  controleFileAssesment: controleFileAssesment,
                  // controlBodyFunction: controlBodyFunction,
                ),
                Rom(
                  controleFileAssesment: controleFileAssesment,
                  // controlBodyFunction: controlBodyFunction,
                ),
                Activity(
                  controleFileAssesment: controleFileAssesment,
                  // controlActivityAndActivityLimitation:
                  //     controlActivityAndActivityLimitation
                ),
                Goals(
                  controleFileAssesment: controleFileAssesment,
                  // controlGoalsAndNote: controlGoalsAndNote,
                ),
                BlocProvider(
                  create: (context) => PateintInfoCubit(),
                  child: Note(
                    id: id,
                    controleFileAssesment: controleFileAssesment,
                    // controlGoalsAndNote: controlGoalsAndNote
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
