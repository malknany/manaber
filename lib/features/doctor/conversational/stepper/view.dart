import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/features/doctor/conversational/stepper/widget/child_developmental_history.dart';
import 'package:manaber/features/doctor/conversational/stepper/widget/child_medical_history.dart';
import 'package:manaber/features/doctor/conversational/stepper/widget/medical_and_genetic_history_of_the_family.dart';
import 'package:manaber/features/doctor/conversational/stepper/widget/note_conversation.dart';
import 'package:manaber/features/doctor/conversational/stepper/widget/personal_history_stepper_conversational.dart';
import 'package:manaber/shared/styles/colors.dart';

class StepperConversational extends StatelessWidget {
  StepperConversational(
      {super.key,
      required this.controleChildDevelopmentalHistory,
      required this.controleNoteConversation,
      required this.controlerChildMedicalAndMedicalHistory,
      required this.controlerMedicalAndGeneticHistoryOfTheFamily,
      required this.personalHistoryConversational,required this.controleConversational});

  final StepperPersonalHistoryConversational personalHistoryConversational;
  final StepperMedicalAndGeneticHistoryOfTheFamily
      controlerMedicalAndGeneticHistoryOfTheFamily;
  final StepperChildMedicalAndMedicalHistory
      controlerChildMedicalAndMedicalHistory;
  final StepperChildDevelopmentalHistory controleChildDevelopmentalHistory;
  final StepperNoteConversation controleNoteConversation;
  final PageController _pageController = PageController();
  final ControleConversational controleConversational;

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
                PersonalHistoryConversational(
                  controleConversational: controleConversational,
                    personalHistoryConversational:
                        personalHistoryConversational,),
                MedicalAndGeneticHistoryOfTheFamily(
                    controleConversational:
                        controleConversational),
                ChildMedicalAndMedicalHistory(
                    controlerChildMedicalAndMedicalHistory:
                        controlerChildMedicalAndMedicalHistory),
                ChildDevelopmentalHistory(
                    controleChildDevelopmentalHistory:
                        controleChildDevelopmentalHistory),
                NoteConversation(
                    controleNoteConversation: controleNoteConversation)
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
                    backgroundColor: AppColors.primarycolor,
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
                    backgroundColor: AppColors.primarycolor,
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
