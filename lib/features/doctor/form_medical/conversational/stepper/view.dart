import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../keep_alive.dart';
import '../../cubit/pateint_info_cubit.dart';
import '../../model.dart';
import '../../../../../shared/styles/colors.dart';
import 'controler.dart';
import 'widget/child_developmental_history.dart';
import 'widget/child_medical_history.dart';
import 'widget/medical_and_genetic_history_of_the_family.dart';
import 'widget/note_conversation.dart';
import 'widget/personal_history_stepper_conversational.dart';

class StepperConversational extends StatelessWidget {
  StepperConversational(
      {super.key,
      required this.id,
      required this.controleConversational,
      required this.listOfModelPatenitInfo});
  final PageController _pageController = PageController();
  final ControlConversational controleConversational;
  final List<ModelPatientInfo> listOfModelPatenitInfo;
  final String id;

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
    final List<ModelPatientInfo> medicalGenetic = [];
    final List<ModelPatientInfo> childMedical = [];
    final List<ModelPatientInfo> childDevelopment = [];
    final List<ModelPatientInfo> note = [];
    for (final person in listOfModelPatenitInfo) {
      if (person.section == 'personal') {
        personalHistory.add(person);
      }
      if (person.section == 'medical_genetic') {
        medicalGenetic.add(person);
      }
      if (person.section == 'child_medical') {
        childMedical.add(person);
      }
      if (person.section == 'child_development') {
        childDevelopment.add(person);
      }
      if (person.section == 'note') {
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
                  page: PersonalHistoryConversational(
                    personalHistory: personalHistory,
                    controlConversational: controleConversational,
                  ),
                ),
                KeepAliveScreen(
                  page: MedicalAndGeneticHistoryOfTheFamily(
                      medicalAndGeneticHistoryOfTheFamily: medicalGenetic,
                      controlConversational: controleConversational),
                ),
                KeepAliveScreen(
                  page: ChildMedicalAndMedicalHistory(
                      childMedicalAndMedicalHistory: childMedical,
                      controlConversational: controleConversational),
                ),
                KeepAliveScreen(
                  page: ChildDevelopmentalHistory(
                      childDevelopmentalHistory: childDevelopment,
                      controlConversational: controleConversational),
                ),
                BlocProvider(
                  create: (context) => PatientInfoCubit(),
                  child: KeepAliveScreen(
                    page: NoteConversation(
                      noteConversation: note,
                      controlConversational: controleConversational,
                      id: id,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    _navigateToPreviousPage();
                  },
                  child: const Text('السابق',
                      style: TextStyle(color: Colors.white)),
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
                  child: const Text('التالي',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
