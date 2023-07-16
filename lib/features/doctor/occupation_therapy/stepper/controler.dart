import 'package:flutter/material.dart';

import 'package:manaber/features/doctor/occupation_therapy/stepper/model.dart';

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

class OccupationPreformanceTEC {
  final problemList = TextEditingController();
  final longTermGoal = TextEditingController();
  final shortTermGoal = TextEditingController();
  final note = TextEditingController();
}

class AssociatedDisordersTEC {
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

class BodyFunctionStrucerTEC {
  final neuromuscularStatusUpperLimb = TextEditingController();
  final neuromuscularStatusLowerLimb = TextEditingController();
  final neuromuscularStatusNote = TextEditingController();
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

class PersonalHistoryTEC {
  final patientName = TextEditingController();
  final diagnosis = TextEditingController();
  final frequencyOfTreatment = TextEditingController();
  final age = TextEditingController();
  final sex = TextEditingController();
  final diseases = TextEditingController();
  final surgery = TextEditingController();
}

class BehaviorADLSTEC {
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

class ControleOccupation {
  OccupationPreformanceTEC controleOccupationPreformance =
      OccupationPreformanceTEC();
  BehaviorADLSTEC controleBehaviorADLS = BehaviorADLSTEC();
  AssociatedDisordersTEC controleAssociatedDisorders = AssociatedDisordersTEC();
  PersonalHistoryTEC controlePersonalHistory = PersonalHistoryTEC();
  BodyFunctionStrucerTEC controleBodyFunctionStrucer = BodyFunctionStrucerTEC();
  List<ModelOccupation> listOfPationHistory = [];
  List<ModelOccupation> listOfBodyFunctionStrucer = [];
  List<ModelOccupation> listOfBehaviorADLS = [];
  List<ModelOccupation> listOfAssociatedDisorders = [];
  List<ModelOccupation> listOfOccupationPreformance = [];
  ControleOccupation() {
    listOfPationHistory = [
      ModelTextFiledOccupation(
          labelname: 'Patient name',
          textEditingController: controlePersonalHistory.patientName),
      ModelTextFiledOccupation(
          labelname: 'Diagnosis',
          textEditingController: controlePersonalHistory.diagnosis),
      ModelTextFiledOccupation(
          labelname: 'Frequency of treatment',
          textEditingController: controlePersonalHistory.frequencyOfTreatment),
      ModelTextFiledOccupation(
          textInputType: TextInputType.number,
          labelname: 'Age',
          textEditingController: controlePersonalHistory.age),
      ModelDropDownOccupation(
          lableName: 'Sex',
          itemList: ['Male', 'Femal'],
          textEditingController: controlePersonalHistory.sex),
      ModelTextFiledOccupation(
          labelname: 'Diseases',
          textEditingController: controlePersonalHistory.diseases),
      ModelTextFiledOccupation(
          labelname: 'Surgery',
          textEditingController: controlePersonalHistory.surgery),
    ];
    listOfBodyFunctionStrucer = [
      ModelDividerOccupation(text: 'Neuromuscular Status'),
      ModelDropDownOccupation(
          lableName: 'Upper limb',
          itemList: [
            "Spastic",
            "Flaccid",
            "Normal",
          ],
          textEditingController:
              controleBodyFunctionStrucer.neuromuscularStatusUpperLimb),
      ModelDropDownOccupation(
          lableName: 'Lower limb',
          itemList: [
            "Spastic",
            "Flaccid",
            "Normal",
          ],
          textEditingController:
              controleBodyFunctionStrucer.neuromuscularStatusLowerLimb),
      ModelTextFiledOccupation(
          labelname: 'Note',
          textEditingController:
              controleBodyFunctionStrucer.neuromuscularStatusNote),
      ModelDividerOccupation(text: 'Balance'),
      ModelTextFiledOccupation(
          labelname: 'Sitting Balance Static',
          textEditingController:
              controleBodyFunctionStrucer.sittingBalanceStatic),
      ModelTextFiledOccupation(
          labelname: 'Sitting Balance dynamic',
          textEditingController:
              controleBodyFunctionStrucer.sittingBalanceDynamic),
      ModelTextFiledOccupation(
          labelname: 'Posture',
          textEditingController: controleBodyFunctionStrucer.posture),
      ModelTextFiledOccupation(
          labelname: 'Gait',
          textEditingController: controleBodyFunctionStrucer.gait),
      ModelTextFiledOccupation(
          labelname: 'Deformities',
          textEditingController: controleBodyFunctionStrucer.deformities),
      ModelDropDownOccupation(
          lableName: 'Muscle bulk',
          itemList: ["Normal", "atrophy", "less than normal", "speudo trophy"],
          textEditingController: controleBodyFunctionStrucer.musclebulk),
      ModelTextFiledOccupation(
          labelname: 'Leg Length Discrepancy',
          textEditingController:
              controleBodyFunctionStrucer.legLengthDiscrepancy),
      ModelTextFiledOccupation(
          labelname: 'Skin Condition',
          textEditingController: controleBodyFunctionStrucer.skinCondition),
      ModelTextFiledOccupation(
          labelname: 'Assistive Devices',
          textEditingController: controleBodyFunctionStrucer.assistiveDevices),
    ];
    listOfBehaviorADLS = [
      ModelDividerOccupation(text: 'Behavior'),
      ModelDropDownOccupation(
          lableName: 'Aggression',
          itemList: ['Yes', 'No'],
          textEditingController: controleBehaviorADLS.aggression),
      ModelDropDownOccupation(
          lableName: 'Hyper activity',
          itemList: ['Yes', 'No'],
          textEditingController: controleBehaviorADLS.hyperActivity),
      ModelDropDownOccupation(
          lableName: 'Follow instructions',
          itemList: ['Yes', 'No'],
          textEditingController: controleBehaviorADLS.followInstructions),
      ModelDropDownOccupation(
          lableName: 'Instruction with other children',
          itemList: ['Yes', 'No'],
          textEditingController:
              controleBehaviorADLS.instructionWithOtherChildren),
      ModelDropDownOccupation(
          lableName: 'Discipline',
          itemList: ['Yes', 'No'],
          textEditingController: controleBehaviorADLS.discipline),
      ModelDividerOccupation(text: 'A.D.L.S'),
      ModelDropDownOccupation(
          lableName: 'Feeding',
          itemList: [' Can do', "Can't do", "With assistance "],
          textEditingController: controleBehaviorADLS.feeding),
      ModelDropDownOccupation(
          lableName: 'Brushing teeth',
          itemList: [' Can do', "Can't do", "With assistance "],
          textEditingController: controleBehaviorADLS.brushingTeeth),
      ModelDropDownOccupation(
          lableName: 'Dressing',
          itemList: [' Can do', "Can't do", "With assistance "],
          textEditingController: controleBehaviorADLS.dressing),
      ModelDropDownOccupation(
          lableName: 'Toilet',
          itemList: [' Can do', "Can't do", "With assistance "],
          textEditingController: controleBehaviorADLS.toilet),
    ];
    listOfAssociatedDisorders = [
      ModelTextFiledOccupation(
          labelname: 'Vision',
          textEditingController: controleAssociatedDisorders.vision),
      ModelTextFiledOccupation(
          labelname: 'Hearing ',
          textEditingController: controleAssociatedDisorders.hearing),
      ModelTextFiledOccupation(
          labelname: 'Speech',
          textEditingController: controleAssociatedDisorders.speech),
      ModelDividerOccupation(text: 'Developmental milestone'),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.headControl,
          lableName: 'Head control ',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.rolling,
          lableName: 'Rolling  ',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.sitting,
          lableName: 'Sitting  ',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.creeping,
          lableName: 'Creeping ',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.crayoning,
          lableName: 'Crayoning',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.standing,
          lableName: 'Standing ',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.walking,
          lableName: 'Walking ',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDividerOccupation(text: 'sensory skills'),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.tactile,
          lableName: 'Tactile ',
          itemList: const [
            "Hypo  response",
            "Hyper response ",
            "Normal response"
          ]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.visual,
          lableName: 'Visual ',
          itemList: const [
            "Hypo  response",
            "Hyper response ",
            "Normal response"
          ]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.auditory,
          lableName: 'Auditory ',
          itemList: const [
            "Hypo  response",
            "Hyper response ",
            "Normal response"
          ]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.vestibular,
          lableName: 'Vestibular ',
          itemList: const [
            "Hypo  response",
            "Hyper response ",
            "Normal response"
          ]),
    ];
    listOfOccupationPreformance = [
      ModelTextFiledOccupation(
          labelname: 'Problem list',
          textEditingController: controleOccupationPreformance.problemList),
      ModelTextFiledOccupation(
          labelname: 'short term goals',
          textEditingController: controleOccupationPreformance.shortTermGoal),
      ModelTextFiledOccupation(
          labelname: 'Long term goals',
          textEditingController: controleOccupationPreformance.longTermGoal),
      ModelTextFiledOccupation(
          labelname: 'Note ',
          textEditingController: controleOccupationPreformance.note),
    ];
  }
}
