import 'package:flutter/material.dart';
import '../controler.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class OccupationalPerformance extends StatelessWidget {
  const OccupationalPerformance(
      {super.key, required this.controlerOccupationPreformance});
  final StepperOccupationPreformance controlerOccupationPreformance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Occupational Performance'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormFiledStepper(
                    labelname: 'Problem list',
                    textEditingController:
                        controlerOccupationPreformance.problemList),
                TextFormFiledStepper(
                    labelname: 'short term goals',
                    textEditingController:
                        controlerOccupationPreformance.shortTermGoal),
                TextFormFiledStepper(
                    labelname: 'Long term goals',
                    textEditingController:
                        controlerOccupationPreformance.longTermGoal),
              ],
            ),
          )),
    );
  }
}
