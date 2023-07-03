import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/view.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';

class NoteOccupation extends StatelessWidget {
  const NoteOccupation(
      {super.key,
      required this.controlerOccupationPreformance,
      required this.controleBodyFunctionStrucer,
      required this.controlePersonalHistory,
      required this.controlerAssociatedDisorders,
      required this.controlerBehaviorADLS,
      required this.controlerBodyFunctionStrucer});
  final StepperOccupationPreformance controlerOccupationPreformance;
  final StepperAssociatedDisorders controlerAssociatedDisorders;
  final StepperBehaviorADLS controlerBehaviorADLS;
  final StepperBodyFunctionStrucer controlerBodyFunctionStrucer;
  final StepperBodyFunctionStrucer controleBodyFunctionStrucer;
  final StepperPersonalHistory controlePersonalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
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
                    labelname: 'Note ',
                    textEditingController: controlerOccupationPreformance.note),
                ButtonText(
                    text: "Save",
                    onPressed: () {
                      navigateTo(
                          context,
                          InfoOccupationScreen(
                              controleAssociatedDisorders:
                                  controlerAssociatedDisorders,
                              controleBehaviorADLS: controlerBehaviorADLS,
                              controleBodyFunctionStrucer:
                                  controleBodyFunctionStrucer,
                              controleOccupationPreformance:
                                  controlerOccupationPreformance,
                              controlePersonalHistory:
                                  controlePersonalHistory));
                    })
              ],
            ),
          )),
    );
  }
}
