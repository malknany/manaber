import 'package:flutter/material.dart';
import '../controller.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class Goals extends StatelessWidget {
  const Goals({super.key, required this.controlGoalsAndNote});

  final StepperControlGoalsAndNote controlGoalsAndNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Goals'),
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
                  labelname: 'Short Goal',
                  textEditingController: controlGoalsAndNote.shortGoals),
              TextFormFiledStepper(
                  labelname: 'Long Goal',
                  textEditingController: controlGoalsAndNote.longGoals),
            ],
          ),
        ),
      ),
    );
  }
}
