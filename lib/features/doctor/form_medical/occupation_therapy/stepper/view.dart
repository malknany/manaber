import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'controler.dart';
import 'widget/Behavior_ADLS.dart';
import 'widget/associated_disorders.dart';
import 'widget/body_function_strucer.dart';
import 'widget/note_occupation.dart';
import 'widget/occupational_perform.dart';
import 'widget/personal_history_stepper.dart';
import '../../../../../shared/styles/colors.dart';

class StepperOccupation extends StatelessWidget {
  StepperOccupation(
      {super.key,
      required this.controleOccupation,
      required this.id,
      required this.listOfInfoPatient});
  final String id;
  final List<ModelPatientInfo> listOfInfoPatient;
  final ControleOccupation controleOccupation;
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
    final List<ModelPatientInfo> associatedDisorders = [];
    final List<ModelPatientInfo> bodyFunctionAndStrucer = [];
    final List<ModelPatientInfo> behaviorAndADLS = [];
    final List<ModelPatientInfo> note = [];
    for (final person in listOfInfoPatient) {
      if (person.section == 'Personal History') {
        personalHistory.add(person);
      }
      if (person.section == 'Associated Disorders') {
        associatedDisorders.add(person);
      }
      if (person.section == 'Body Function and Structure') {
        bodyFunctionAndStrucer.add(person);
      }
      if (person.section == 'Behavior and ADLS') {
        behaviorAndADLS.add(person);
      }
      if (person.section == 'Occupation Performance') {
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
                PersonalHistory(
                    personalHistory: personalHistory,
                    controleOccupation: controleOccupation),
                AssociatedDisorders(
                    controleOccupation: controleOccupation,
                    associatedDisorders: associatedDisorders),
                BodyFunctionStrucer(
                    controleOccupation: controleOccupation,
                    bodyFunctionStrucer: bodyFunctionAndStrucer),
                BehaviorADLS(
                    controleOccupation: controleOccupation,
                    behaviorADLS: behaviorAndADLS),
                OccupationalPerformance(
                    controleOccupation: controleOccupation,
                    occupationalPerformance: note),
                BlocProvider(
                  create: (context) => PateintInfoCubit(),
                  child: NoteOccupation(
                      noteOccupation: note,
                      controleOccupation: controleOccupation,
                      id: id),
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
                    const Text('back', style: TextStyle(color: Colors.white)),
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
