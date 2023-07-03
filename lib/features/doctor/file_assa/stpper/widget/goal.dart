import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class Goals extends StatelessWidget {
  const Goals({super.key,required this.controlGoalsAndNote});

  final StepperControlGoalsAndNote
      controlGoalsAndNote;

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
                  labelname: 'Long Goal', textEditingController: controlGoalsAndNote.longGoals),
              TextFormFiledStepper(
                  labelname: 'Short Goal', textEditingController: controlGoalsAndNote.shortGoals),
            ],
          ),
        ),
      ),
    );
  }
}
