import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/stpper/model.dart';
// import 'package:manaber/features/file_assa/stpper/widget/ICF_body_function_structure.dart';

class StepperControlPatientInfo {
  final createdBy = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final dob = TextEditingController();
  final gender = TextEditingController();
  final consanguinity = TextEditingController();
  final pregnancyProblem = TextEditingController();
  final birthWeight = TextEditingController();
  final incubation = TextEditingController();
  final vaccination = TextEditingController();
  final currentMedications = TextEditingController();
  final previousMedications = TextEditingController();
  final convulsions = TextEditingController();
  final assistiveDevices = TextEditingController();
  final otherAssociatedProblems = TextEditingController();
  final similarCasesInTheFamily = TextEditingController();
  final investigations = TextEditingController();
  final diagnosis = TextEditingController();
}

class StepperControlBodyFunction {
  final mentalStatus = TextEditingController();
  final voiceSpeech = TextEditingController();
  final functionOfMetabolicAndEndocrine = TextEditingController();
  final functionOfCardiovascularRespiration = TextEditingController();
  final superficial = TextEditingController();
  final vestibular = TextEditingController();
  final proprioception = TextEditingController();
  final tactile = TextEditingController();
  final stancePhase = TextEditingController();
  final swingPhase = TextEditingController();
  final balance = TextEditingController();
  final headControl = TextEditingController();
  final rolling = TextEditingController();
  final creeping = TextEditingController();
  final crawling = TextEditingController();
  final sitting = TextEditingController();
  final standing = TextEditingController();
  final walking = TextEditingController();
  final fineMotorFunctionHandFunction = TextEditingController();
  final vision = TextEditingController();
  final hearing = TextEditingController();
  final involantaryMovment = TextEditingController();
  final palmarReflex = TextEditingController();
  final planterReflex = TextEditingController();
  final rootingReflex = TextEditingController();
  final suckingReflex = TextEditingController();
  final supineLabyrinthine = TextEditingController();
  final proneLabyrinthine = TextEditingController();
  final symmetricalTonicNeckReflex = TextEditingController();
  final asymmetricalTonicNeckReflex = TextEditingController();
  final footHandReplacement = TextEditingController();
  final moroReflex = TextEditingController();
  final landauReflex = TextEditingController();
  final protective = TextEditingController();
  final rightingAndEquilibriumReflex = TextEditingController();
  //Muscle strength
  final glutealRight = TextEditingController();
  final glutealLeft = TextEditingController();
  final abductorsRight = TextEditingController();
  final abductorsLeft = TextEditingController();
  final hipFlexorsRight = TextEditingController();
  final hipFlexorsLeft = TextEditingController();
  final hipIRRight = TextEditingController();
  final hipIRLeft = TextEditingController();
  final hipERRight = TextEditingController();
  final hipERLeft = TextEditingController();
  final quadricepsRight = TextEditingController();
  final quadricepsLeft = TextEditingController();
  final hamstringRight = TextEditingController();
  final hamstringLeft = TextEditingController();
  final plantarFlexorsRight = TextEditingController();
  final plantarFlexorsLeft = TextEditingController();
  final dorsiflexorsRight = TextEditingController();
  final dorsiflexorsLeft = TextEditingController();
  final shoulderFlexorsRight = TextEditingController();
  final shoulderFlexorsLeft = TextEditingController();
  final shoulderExtensorsRight = TextEditingController();
  final shoulderExtensorsLeft = TextEditingController();
  final shoulderRight = TextEditingController();
  final shoulderLeft = TextEditingController();
  final adductorsRight = TextEditingController();
  final adductorsLeft = TextEditingController();
  final shoulderIRRight = TextEditingController();
  final shoulderIRLeft = TextEditingController();
  final shoulderERRight = TextEditingController();
  final shoulderERLeft = TextEditingController();
  final elbowFlexorsRight = TextEditingController();
  final elbowFlexorsLeft = TextEditingController();
  final elbowExtensorsRight = TextEditingController();
  final elbowExtensorsLeft = TextEditingController();
  final wristFlexorsRight = TextEditingController();
  final wristFlexorsLeft = TextEditingController();
  final wristExtensorsRight = TextEditingController();
  final wristExtensorsLeft = TextEditingController();
  final muscleTon = TextEditingController();
  final gaitnote = TextEditingController();
  //muscl ton
  final adductorsKneeFlexionTonRight = TextEditingController();
  final adductorsKneeFlexionTonLeft = TextEditingController();
  final adductorsKneeExtensionTonRight = TextEditingController();
  final adductorsKneeExtensionTonLeft = TextEditingController();
  final illiospoasTonRight = TextEditingController();
  final illiospoasTonLeft = TextEditingController();
  final hipIRtonTonRight = TextEditingController();
  final hipIRtonTonLeft = TextEditingController();
  final hipERtonTonRight = TextEditingController();
  final hipERtonTonLeft = TextEditingController();
  final quadricepsTonRight = TextEditingController();
  final quadricepsTonLeft = TextEditingController();
  final hamstringTonRight = TextEditingController();
  final hamstringTonLeft = TextEditingController();
  final gastrocnemiusTonRight = TextEditingController();
  final gastrocnemiusTonLeft = TextEditingController();
  final soleusTonRight = TextEditingController();
  final soleusTonLeft = TextEditingController();
  final tibialisAntTonRight = TextEditingController();
  final tibialisAntTonLeft = TextEditingController();
  final tibialisPostTonRight = TextEditingController();
  final tibialisPostTonLeft = TextEditingController();
  final shoulderTonRight = TextEditingController();
  final shoulderTonLeft = TextEditingController();
  final adductorsTonRight = TextEditingController();
  final adductorsTonLeft = TextEditingController();
  final shoulderIRTonRight = TextEditingController();
  final shoulderIRTonLeft = TextEditingController();
  final shoulderERTonRight = TextEditingController();
  final shoulderERTonLeft = TextEditingController();
  final elbowFlexorsTonRight = TextEditingController();
  final elbowFlexorsTonLeft = TextEditingController();
  final wristFlexorsTonRight = TextEditingController();
  final wristFlexorsTonLeft = TextEditingController();
  final fingerFlexorsTonRight = TextEditingController();
  final fingerFlexorsTonLeft = TextEditingController();
  //
  final muscleBulk = TextEditingController();
  final upperLimb = TextEditingController();
  final lowerLimb = TextEditingController();
  //Muscle
  final glutealMuscleRight = TextEditingController();
  final glutealMuscleLeft = TextEditingController();
  final abductorsMuscleRight = TextEditingController();
  final abductorsMuscleLeft = TextEditingController();
  final hipFlexorsMuscleRight = TextEditingController();
  final hipFlexorsMuscleLeft = TextEditingController();
  final quadricepsMuscleRight = TextEditingController();
  final quadricepsMuscleLeft = TextEditingController();
  final hamstringMuscleRight = TextEditingController();
  final hamstringMuscleLeft = TextEditingController();
  final planterFlexorsMuscleRight = TextEditingController();
  final planterFlexorsMuscleLeft = TextEditingController();
  final dorsiflexorsMuscleRight = TextEditingController();
  final dorsiflexorsMuscleLeft = TextEditingController();
  final shoulderFlexorsMuscleRight = TextEditingController();
  final shoulderFlexorsMuscleLeft = TextEditingController();
  final shoulderExtensorsMuscleRight = TextEditingController();
  final shoulderExtensorsMuscleLeft = TextEditingController();
  final shoulderAbductorsMuscleRight = TextEditingController();
  final shoulderAbductorsMuscleLeft = TextEditingController();
  final elbowFlexorsMuscleRight = TextEditingController();
  final elbowFlexorsMuscleLeft = TextEditingController();
  final elbowExtensorsMuscleRight = TextEditingController();
  final elbowExtensorsMuscleLeft = TextEditingController();
  final wristFlexorsMuscleRight = TextEditingController();
  final wristFlexorsMuscleLeft = TextEditingController();
  final wristExtensorsMuscleRight = TextEditingController();
  final wristExtensorsMuscleLeft = TextEditingController();
  final fingerFlexorsMuscleRight = TextEditingController();
  final fingerFlexorsMuscleLeft = TextEditingController();
  final adductorsMuscleRight = TextEditingController();
  final adductorsMuscleLeft = TextEditingController();
  final fingerExtensorsMuscleRight = TextEditingController();
  final fingerExtensorsMuscleLeft = TextEditingController();
  //
  final deformities = TextEditingController();
  final fromSitting = TextEditingController();
  final fromStanding = TextEditingController();
  final spine = TextEditingController();
  final pelvic = TextEditingController();
  final legLengthDiscrepancy = TextEditingController();
  final rt = TextEditingController();
  final lf = TextEditingController();
  //
  final hip = TextEditingController();
  final knee = TextEditingController();
  final ankle = TextEditingController();
  final shoulder = TextEditingController();
  final elbow = TextEditingController();
  final note = TextEditingController();
}

class StepperControlActivityAndActivityLimitation {
  final activityAndActivityLimitation = TextEditingController();
  final participationAndParticipationRestriction = TextEditingController();
}

class StepperControlGoalsAndNote {
  final shortGoals = TextEditingController();
  final longGoals = TextEditingController();
  final note = TextEditingController();
}

class ControleFileAssesment {
  final StepperControlPatientInfo controlPatientInfo =
      StepperControlPatientInfo();
   List listPatientInfo = [];
  ControleFileAssesment(){
    listPatientInfo=[
      TextFormFiledStepperModel(
      labelName: 'Created by',
      textEditingController: controlPatientInfo.createdBy,
    ),
    TextFormFiledStepperModel(
      labelName: 'Patient name',
      textEditingController: controlPatientInfo.name,
    ),
    TextFormFiledStepperModel(
      labelName: 'Phone Number',
      textInputType: TextInputType.phone,
      textEditingController: controlPatientInfo.phone,
    ),
    TextFormFiledStepperModel(
      labelName: 'Date of birthday',
      textInputType: TextInputType.datetime,
      textEditingController: controlPatientInfo.dob,
    ),
    DropdownButtonItemModel(
      labelName: 'Gender',
      controller: controlPatientInfo.gender,
      itemList: const ['Male', 'Female'],
    ),
    DropdownButtonItemModel(
      labelName: 'Consanguinity',
      controller: controlPatientInfo.consanguinity,
      itemList: const ['Yes', 'No'],
    ),
    TextFormFiledStepperModel(
      labelName: 'Pregnancy Problem',
      textEditingController: controlPatientInfo.pregnancyProblem,
    ),
    TextFormFiledStepperModel(
      labelName: 'Birth Weight',
      textEditingController: controlPatientInfo.birthWeight,
    ),
    TextFormFiledStepperModel(
      labelName: 'Incubation',
      textEditingController: controlPatientInfo.incubation,
    ),
    DropdownButtonItemModel(
      labelName: 'Vaccination',
      controller: controlPatientInfo.vaccination,
      itemList: const ['Yes', 'No'],
    ),
    TextFormFiledStepperModel(
      labelName: 'Current Medications',
      textEditingController: controlPatientInfo.currentMedications,
    ),
    TextFormFiledStepperModel(
      labelName: 'Previous Medications',
      textEditingController: controlPatientInfo.previousMedications,
    ),
    DropdownButtonItemModel(
      labelName: 'Convulsions',
      controller: controlPatientInfo.convulsions,
      itemList: const [
        'No',
        'With history',
        'Controlled',
        'Uncontrolled',
      ],
    ),
    TextFormFiledStepperModel(
      labelName: 'Assistive Devices',
      textEditingController: controlPatientInfo.assistiveDevices,
    ),
    TextFormFiledStepperModel(
      labelName: 'Other Associated Problems',
      textEditingController:
          controlPatientInfo.otherAssociatedProblems,
    ),
    TextFormFiledStepperModel(
      labelName: 'Similar cases in the family',
      textEditingController:
          controlPatientInfo.similarCasesInTheFamily,
    ),
    TextFormFiledStepperModel(
      labelName: 'Investigations',
      textEditingController: controlPatientInfo.investigations,
    ),
    TextFormFiledStepperModel(
      labelName: 'Diagnosis',
      textEditingController: controlPatientInfo.diagnosis,
    ),
    ];
  }
}

//  List<Step> getSteps() {
//     return [
//       //Patient Information
//       Step(
//         state: currentStep > 0 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 0,
//         title: const Text(
//           'Patient Information',
//         ),
//         // content: const PatientInformation(),
//         content: const SizedBox.shrink(),
//       ),
//       Step(
//           state: currentStep > 1 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 1,
//           //ICF Body function And structure
//           title: const Text(
//             'ICF Body function And structure',
//           ),
//           content:  const ICFBodyfunctionAndstructure()),
//       Step(
//         state: currentStep > 2 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 2,
//         //Neurological Examination
//         title: const Text(
//           'Neurological Examination ',
//         ),
//         content: Container(),
//       ),
//       Step(
//         state: currentStep > 3 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 3,
//         //Motor system
//         title: const Text(
//           'Motor system',
//         ),
//         content: Container(),
//       ),
//       Step(
//         state: currentStep > 4 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 4,
//         //Level of Selectivity
//         title: const Text(
//           'Level of Selectivity',
//         ),
//         content: Container(),
//       ),
//       Step(
//         state: currentStep > 5 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 5,
//         //Muscloskeletal  Examination
//         title: const Text(
//           'Muscloskeletal Examination',
//         ),
//         content: Container(),
//       ),
//       Step(
//         state: currentStep > 6 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 6,
//         //Rom
//         title: const Text(
//           'Rom',
//         ),
//         content: Container(),
//       ),
//       Step(
//         state: currentStep > 7 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 7,
//         //Participation And Participation Restriction
//         title: const Text(
//           'Participation And Participation Restriction',
//         ),
//         content: Container(),
//       ),
//       Step(
//         state: currentStep > 8 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 8,
//         title: const Text(
//           //Goals
//           'Goals',
//         ),
//         content: Container(),
//       ),
//       Step(
//         state: currentStep > 9 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 9,
//         title: const Text(
//           //Note
//           'Note',
//         ),
//         content: Container(),
//       ),
//     ];
//   }