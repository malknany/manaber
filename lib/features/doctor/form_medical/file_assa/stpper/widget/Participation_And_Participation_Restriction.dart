// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

//ctivity&Activity Limitation&(Participation AndParticipation Restriction
class Activity extends StatelessWidget {
  Activity({super.key,required this.controlActivityAndActivityLimitation});

  final TextEditingController controller1 = TextEditingController();
  final StepperControlActivityAndActivityLimitation
      controlActivityAndActivityLimitation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Activity'),
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
                  labelname: 'Activity and Activity Limitation',
                  textEditingController: controlActivityAndActivityLimitation.activityAndActivityLimitation),
              TextFormFiledStepper(
                  labelname: 'Participation And Participation Restriction',
                  textEditingController: controlActivityAndActivityLimitation.participationAndParticipationRestriction),
            ],
          ),
        ),
      ),
    );
  }
}
