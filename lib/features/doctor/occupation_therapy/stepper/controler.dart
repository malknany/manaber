import 'package:flutter/material.dart';

class StepperPersonalHistory {
  final patientName = TextEditingController();
  final diagnosis = TextEditingController();
  final frequencyOfTreatment = TextEditingController();
  final age = TextEditingController();
  final sex = TextEditingController();
  final diseases = TextEditingController();
  final surgery = TextEditingController();
}

class StepperAssociatedDisorders {
  final vision = TextEditingController();
  final hearing = TextEditingController();
  final speech = TextEditingController();

  final headControl = TextEditingController();
  final rolling = TextEditingController();
  final sitting = TextEditingController();
  final creeping = TextEditingController();
  final crayoning = TextEditingController();
  final standing = TextEditingController();
  final walking = TextEditingController();
  final tactile = TextEditingController();
  final visual = TextEditingController();
  final auditory = TextEditingController();
  final vestibular = TextEditingController();
}

class StepperBodyFunctionStrucer {
  final neuromuscularStatusUpperLimb = TextEditingController();
  final neuromuscularStatusLowerLimb = TextEditingController();
  final neuromuscularStatusNote = TextEditingController();
  // final flaccidUpperLimb = TextEditingController();
  // final flaccidLowerLimb = TextEditingController();
  // final normalUpperLimb = TextEditingController();
  // final normalLowerLimb = TextEditingController();
  final sittingBalanceStatic = TextEditingController();
  final sittingBalanceDynamic = TextEditingController();
//
  final posture = TextEditingController();
  final gait = TextEditingController();
  final deformities = TextEditingController();
  final musclebulk = TextEditingController();
  final legLengthDiscrepancy = TextEditingController();
  final skinCondition = TextEditingController();
  final assistiveDevices = TextEditingController();
}

class StepperBehaviorADLS {
  final aggression = TextEditingController();
  final hyperActivity = TextEditingController();
  final followInstructions = TextEditingController();
  final instructionWithOtherChildren = TextEditingController();
  final discipline = TextEditingController();
  //
  final feeding = TextEditingController();
  final brushingTeeth = TextEditingController();
  final dressing = TextEditingController();
  final toilet = TextEditingController();
}

class StepperOccupationPreformance {
  final problemList = TextEditingController();
  final longTermGoal = TextEditingController();
  final shortTermGoal = TextEditingController();
  final note = TextEditingController();
}
