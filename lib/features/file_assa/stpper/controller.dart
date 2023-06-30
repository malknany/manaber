import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/stpper/widget/ICF_body_function_structure.dart';

class StepperControl {
  final name = TextEditingController();
  final jobTitle = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  final universityName = TextEditingController();
  final period = TextEditingController();
  final link = TextEditingController();
  final description = TextEditingController();
  final language = TextEditingController();
  final tSkills = TextEditingController();
  final nTSkills = TextEditingController();
  final certificates = TextEditingController();
  final degree = TextEditingController();
  final years = TextEditingController();
  int currentStep = 0;

  List<Step> getSteps() {
    return [
      //Patient Information
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text(
          'Patient Information',
        ),
        // content: const PatientInformation(),
        content: const SizedBox.shrink(),
      ),
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          //ICF Body function And structure
          title: const Text(
            'ICF Body function And structure',
          ),
          content:  const ICFBodyfunctionAndstructure()),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        //Neurological Examination
        title: const Text(
          'Neurological Examination ',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        //Motor system
        title: const Text(
          'Motor system',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        //Level of Selectivity
        title: const Text(
          'Level of Selectivity',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 5 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 5,
        //Muscloskeletal  Examination
        title: const Text(
          'Muscloskeletal Examination',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 6 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 6,
        //Rom
        title: const Text(
          'Rom',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 7 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 7,
        //Participation And Participation Restriction
        title: const Text(
          'Participation And Participation Restriction',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 8 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 8,
        title: const Text(
          //Goals
          'Goals',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 9 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 9,
        title: const Text(
          //Note
          'Note',
        ),
        content: Container(),
      ),
    ];
  }
}
