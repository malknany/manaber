import 'package:flutter/material.dart';

import 'model.dart';

//
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

class ControlOccupation {
  OccupationPreformanceTEC controlOccupationPerformance =
      OccupationPreformanceTEC();
  BehaviorADLSTEC controleBehaviorADLS = BehaviorADLSTEC();
  AssociatedDisordersTEC controleAssociatedDisorders = AssociatedDisordersTEC();
  PersonalHistoryTEC controlePersonalHistory = PersonalHistoryTEC();
  BodyFunctionStrucerTEC controleBodyFunctionStrucer = BodyFunctionStrucerTEC();
  List<ModelOccupation> listOfPationHistory = [];
  List<ModelOccupation> listOfBodyFunctionStrucer = [];
  List<ModelOccupation> listOfBehaviorADLS = [];
  List<ModelOccupation> listOfAssociatedDisorders = [];
  List<ModelOccupation> listOfOccupationPerformance = [];
  ControlOccupation() {
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
          labelName: 'Sex',
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
          labelName: 'Upper limb',
          itemList: ["Spastic", "Flaccid", "Normal"],
          textEditingController:
              controleBodyFunctionStrucer.neuromuscularStatusUpperLimb),
      ModelDropDownOccupation(
          labelName: 'Lower limb',
          itemList: ["Spastic", "Flaccid", "Normal"],
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
          labelName: 'Muscle bulk',
          itemList: [
            "Normal",
            "Atrophy",
            "Less than normal",
            "Speudo trophy",
          ],
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
          labelName: 'Aggression',
          itemList: ["Yes", "No"],
          textEditingController: controleBehaviorADLS.aggression),
      ModelDropDownOccupation(
          labelName: 'Hyper activity',
          itemList: ['Yes', 'No'],
          textEditingController: controleBehaviorADLS.hyperActivity),
      ModelDropDownOccupation(
          labelName: 'Follow instructions',
          itemList: ['Yes', 'No'],
          textEditingController: controleBehaviorADLS.followInstructions),
      ModelDropDownOccupation(
          labelName: 'Instruction with other children',
          itemList: ['Yes', 'No'],
          textEditingController:
              controleBehaviorADLS.instructionWithOtherChildren),
      ModelDropDownOccupation(
          labelName: 'Discipline',
          itemList: ['Yes', 'No'],
          textEditingController: controleBehaviorADLS.discipline),
      ModelDividerOccupation(text: 'A.D.L.S'),
      ModelDropDownOccupation(
          labelName: 'Feeding',
          itemList: ["Can't do", "Can do", "With assistance"],
          textEditingController: controleBehaviorADLS.feeding),
      ModelDropDownOccupation(
          labelName: 'Brushing teeth',
          itemList: ["Can't do", "Can do", "With assistance"],
          textEditingController: controleBehaviorADLS.brushingTeeth),
      ModelDropDownOccupation(
          labelName: 'Dressing',
          itemList: ["Can't do", "Can do", "With assistance"],
          textEditingController: controleBehaviorADLS.dressing),
      ModelDropDownOccupation(
          labelName: 'Toilet',
          itemList: ["Can't do", "Can do", "With assistance"],
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
          labelName: 'Head control ',
          itemList: const ["Can't do", "Can do", "Can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.rolling,
          labelName: 'Rolling  ',
          itemList: const ["Can't do", "Can do", "Can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.sitting,
          labelName: 'Sitting  ',
          itemList: const ["Can't do", "Can do", "Can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.creeping,
          labelName: 'Creeping ',
          itemList: const ["Can't do", "Can do", "Can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.crayoning,
          labelName: 'Crayoning',
          itemList: const ["Can't do", "Can do", "Can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.standing,
          labelName: 'Standing ',
          itemList: const ["Can't do", "Can do", "Can do it with assistance"]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.walking,
          labelName: 'Walking ',
          itemList: const ["can't do", "can do", "can do it with assistance"]),
      ModelDividerOccupation(text: 'sensory skills'),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.tactile,
          labelName: 'Tactile ',
          itemList: const [
            "Hypo response",
            "Hyper response",
            "Normal response"
          ]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.visual,
          labelName: 'Visual ',
          itemList: const [
            "Hypo response",
            "Hyper response",
            "Normal response"
          ]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.auditory,
          labelName: 'Auditory ',
          itemList: const [
            "Hypo response",
            "Hyper response",
            "Normal response"
          ]),
      ModelDropDownOccupation(
          textEditingController: controleAssociatedDisorders.vestibular,
          labelName: 'Vestibular ',
          itemList: const [
            "Hypo response",
            "Hyper response",
            "Normal response"
          ]),
    ];
    listOfOccupationPerformance = [
      ModelTextFiledOccupation(
          labelname: 'Problem list',
          textEditingController: controlOccupationPerformance.problemList),
      ModelTextFiledOccupation(
          labelname: 'short term goals',
          textEditingController: controlOccupationPerformance.shortTermGoal),
      ModelTextFiledOccupation(
          labelname: 'Long term goals',
          textEditingController: controlOccupationPerformance.longTermGoal),
      ModelTextFiledOccupation(
          labelname: 'Note ',
          textEditingController: controlOccupationPerformance.note),
    ];
  }
}
