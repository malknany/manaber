import 'package:flutter/material.dart';

class StepperControl {
  // final name = TextEditingController();
  // final jobTitle = TextEditingController();
  // final email = TextEditingController();
  // final address = TextEditingController();
  // final phone = TextEditingController();
  // final universityName = TextEditingController();
  // final period = TextEditingController();
  // final link = TextEditingController();
  // final description = TextEditingController();
  // final language = TextEditingController();
  // final tSkills = TextEditingController();
  // final nTSkills = TextEditingController();
  // final certificates = TextEditingController();
  // final degree = TextEditingController();
  // final years = TextEditingController();
  int currentStep = 0;

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text(
          'Patient Information',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text(
          'ICF Body function And structure',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text(
          'Neurological Examination ',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text(
          'Motor system ',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(
          'Level of Selectivity ',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(
          'Muscloskeletal  Examination ',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(
          'Rom',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(
          'Participation And Participation Restriction',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(
          'Goals',
        ),
        content: Container(),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(
          'Note',
        ),
        content: Container(),
      ),
    ];
  }
}
