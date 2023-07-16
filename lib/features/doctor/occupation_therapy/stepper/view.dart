import 'package:flutter/material.dart';
import 'controler.dart';
import 'widget/Behavior_ADLS.dart';
import 'widget/associated_disorders.dart';
import 'widget/body_function_strucer.dart';
import 'widget/note_occupation.dart';
import 'widget/occupational_perform.dart';
import 'widget/personal_history_stepper.dart';
import '../../../../shared/styles/colors.dart';

class StepperOccupation extends StatelessWidget {
  StepperOccupation({
    super.key,
    required this.controleOccupation,
  });
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                PersonalHistory(controleOccupation: controleOccupation),
                AssociatedDisorders(controleOccupation: controleOccupation),
                BodyFunctionStrucer(controleOccupation: controleOccupation),
                BehaviorADLS(controleOccupation: controleOccupation),
                OccupationalPerformance(controleOccupation: controleOccupation),
                NoteOccupation(controleOccupation: controleOccupation),
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
