import 'package:flutter/material.dart';
import 'controler.dart';
import 'widget/child_developmental_history.dart';
import 'widget/child_medical_history.dart';
import 'widget/medical_and_genetic_history_of_the_family.dart';
import 'widget/note_conversation.dart';
import 'widget/personal_history_stepper_conversational.dart';
import '../../../../shared/styles/colors.dart';

class StepperConversational extends StatelessWidget {
  StepperConversational({super.key, required this.controleConversational});
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
                ),
                MedicalAndGeneticHistoryOfTheFamily(
                    controleConversational: controleConversational),
                ChildMedicalAndMedicalHistory(
                    controleConversational: controleConversational),
                ChildDevelopmentalHistory(
                    controleConversational: controleConversational),
                NoteConversation(controleConversational: controleConversational)
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
