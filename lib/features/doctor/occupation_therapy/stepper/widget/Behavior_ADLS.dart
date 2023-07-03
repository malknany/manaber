// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class BehaviorADLS extends StatelessWidget {
  const BehaviorADLS({super.key, required this.controlerBehaviorADLS});
  final StepperBehaviorADLS controlerBehaviorADLS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Behavior And ADLS'),
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
                const DividerItem(text: 'Behavior '),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.aggression,
                    lableName: 'Aggression',
                    itemList: const ['Yes', 'No']),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.hyperActivity,
                    lableName: 'Hyper activity',
                    itemList: const ['Yes', 'No']),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.followInstructions,
                    lableName: 'Follow instructions',
                    itemList: const ['Yes', 'No']),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.instructionWithOtherChildren,
                    lableName: 'Instruction with other children',
                    itemList: const ['Yes', 'No']),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.discipline,
                    lableName: 'discipline',
                    itemList: const ['Yes', 'No']),
                const DividerItem(text: 'A.D.L.S'),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.feeding,
                    lableName: 'Feeding',
                    itemList: const [' Can do', "Can't do", "With assistance "]),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.brushingTeeth,
                    lableName: 'Brushing teeth',
                    itemList: const [' Can do', "Can't do", "With assistance "]),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.dressing,
                    lableName: 'Dressing',
                    itemList: const [' Can do', "Can't do", "With assistance "]),
                DropdownButtonItem(
                    controller: controlerBehaviorADLS.toilet,
                    lableName: 'Toilet',
                    itemList: const [' Can do', "Can't do", "With assistance "]),
              ],
            ),
          )),
    );
  }
}
