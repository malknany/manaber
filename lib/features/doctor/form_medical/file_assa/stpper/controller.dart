import 'package:flutter/material.dart';
import 'model.dart';
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
  final StepperControlBodyFunction controlBodyFunction =
      StepperControlBodyFunction();
  final StepperControlActivityAndActivityLimitation
      controlActivityAndActivityLimitation =
      StepperControlActivityAndActivityLimitation();
  final StepperControlGoalsAndNote controlGoalsAndNote =
      StepperControlGoalsAndNote();
  List listPatientInfo = [];
  List listicfBody = [];
  List listNeurological = [];
  List listMotor = [];
  List listlevelOfSelctivity = [];
  List listMuscloskelton = [];
  List listRom = [];
  List listParticipation = [];
  List listGoal = [];
  ControleFileAssesment() {
    listPatientInfo = [
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
        textEditingController: controlPatientInfo.otherAssociatedProblems,
      ),
      TextFormFiledStepperModel(
        labelName: 'Similar cases in the family',
        textEditingController: controlPatientInfo.similarCasesInTheFamily,
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
    listicfBody = [
      DropdownButtonItemModel(
          labelName: 'Mental status',
          controller: controlBodyFunction.mentalStatus,
          itemList: ['Normal', 'Less than nomal', 'Mental retarted']),
      TextFormFiledStepperModel(
          labelName: 'Voice Speech',
          textEditingController: controlBodyFunction.voiceSpeech),
      DropdownButtonItemModel(
          labelName: 'Function of metabolic and endocrine',
          controller: controlBodyFunction.functionOfMetabolicAndEndocrine,
          itemList: ['Normal', 'Less than nomal', 'Malnutrition', 'Obese']),
      TextFormFiledStepperModel(
          labelName: 'Function of Cardiovascular',
          textEditingController:
              controlBodyFunction.functionOfCardiovascularRespiration),
      DividerFileAssModel(text: 'Sensory Examination'),
      TextFormFiledStepperModel(
          labelName: 'Superficial',
          textEditingController: controlBodyFunction.superficial),
      TextFormFiledStepperModel(
          labelName: 'Vestibular',
          textEditingController: controlBodyFunction.vestibular),
      TextFormFiledStepperModel(
          labelName: 'Proprioception',
          textEditingController: controlBodyFunction.proprioception),
      TextFormFiledStepperModel(
          labelName: 'Tactile',
          textEditingController: controlBodyFunction.tactile),
      DividerFileAssModel(text: 'GaiT Problems'),
      TextFormFiledStepperModel(
          labelName: 'Note',
          textEditingController: controlBodyFunction.gaitnote),
      TextFormFiledStepperModel(
          labelName: 'Stance phase',
          textEditingController: controlBodyFunction.stancePhase),
      TextFormFiledStepperModel(
          labelName: 'Swing phase',
          textEditingController: controlBodyFunction.swingPhase),
      TextFormFiledStepperModel(
          labelName: 'Balance',
          textEditingController: controlBodyFunction.balance),
      BottomSheetFileAssModel(
        name: 'Developmental Milestones',
        itemList: <TextFormFiledStepperModel>[
          TextFormFiledStepperModel(
              labelName: 'Head control',
              textEditingController: controlBodyFunction.headControl),
          TextFormFiledStepperModel(
              labelName: 'Rolling',
              textEditingController: controlBodyFunction.rolling),
          TextFormFiledStepperModel(
              labelName: 'Creeping',
              textEditingController: controlBodyFunction.creeping),
          TextFormFiledStepperModel(
              labelName: 'Crawling',
              textEditingController: controlBodyFunction.crawling),
          TextFormFiledStepperModel(
              labelName: 'Sitting',
              textEditingController: controlBodyFunction.sitting),
          TextFormFiledStepperModel(
              labelName: 'Standing',
              textEditingController: controlBodyFunction.standing),
          TextFormFiledStepperModel(
              labelName: 'Walking',
              textEditingController: controlBodyFunction.walking),
        ],
      ),
      TextFormFiledStepperModel(
          labelName: 'Fine Motor Function (Hand Function)',
          textEditingController:
              controlBodyFunction.fineMotorFunctionHandFunction),
    ];
    listNeurological = [
      TextFormFiledStepperModel(
          labelName: 'Vision',
          textEditingController: controlBodyFunction.vision),
      TextFormFiledStepperModel(
          labelName: 'Hearing',
          textEditingController: controlBodyFunction.hearing),
      TextFormFiledStepperModel(
          labelName: 'Invountary movement',
          textEditingController: controlBodyFunction.involantaryMovment),
      BottomSheetFileAssModel(name: 'Primitive Reflexes', itemList: [
        DropdownButtonItemModel(
            labelName: 'Palmar reflex',
            controller: controlBodyFunction.palmarReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Planter reflex',
            controller: controlBodyFunction.planterReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Rooting reflex',
            controller: controlBodyFunction.rootingReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Sucking reflex',
            controller: controlBodyFunction.suckingReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Supine labyrinthine',
            controller: controlBodyFunction.supineLabyrinthine,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Prone labyrinthine',
            controller: controlBodyFunction.proneLabyrinthine,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Symmetrical tonic neck reflex',
            controller: controlBodyFunction.symmetricalTonicNeckReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Asymmetrical tonic neck reflex',
            controller: controlBodyFunction.asymmetricalTonicNeckReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Foot-hand replacement',
            controller: controlBodyFunction.footHandReplacement,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Moro reflex',
            controller: controlBodyFunction.moroReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
        DropdownButtonItemModel(
            labelName: 'Landau reflex',
            controller: controlBodyFunction.moroReflex,
            itemList: ['integrated', 'Not integrated', 'Not Tested']),
      ]),
      BottomSheetFileAssModel(name: 'Advanced reflex', itemList: [
        DropdownButtonItemModel(
            labelName: 'Protective',
            controller: controlBodyFunction.protective,
            itemList: ['integrated', 'weak', 'Not integrated']),
        DropdownButtonItemModel(
            labelName: 'Righting and Equilibrium reflex',
            controller: controlBodyFunction.rightingAndEquilibriumReflex,
            itemList: ['integrated', 'weak', 'Not integrated']),
      ]),
    ];
    listMotor = [
      BottomSheetFileAssModel(
        name: 'Muscle strength',
        itemList: [
          TextFormFiledRightLiftModel(
              labelName: 'Gluteal',
              controllerLeft: controlBodyFunction.glutealLeft,
              controllerRight: controlBodyFunction.glutealRight),
          TextFormFiledRightLiftModel(
              labelName: 'Abductors',
              controllerLeft: controlBodyFunction.abductorsLeft,
              controllerRight: controlBodyFunction.abductorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Adductor',
              controllerLeft: controlBodyFunction.adductorsLeft,
              controllerRight: controlBodyFunction.adductorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Hip flexors',
              controllerLeft: controlBodyFunction.hipFlexorsLeft,
              controllerRight: controlBodyFunction.hipFlexorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Hip IR',
              controllerLeft: controlBodyFunction.hipIRLeft,
              controllerRight: controlBodyFunction.hipIRRight),
          TextFormFiledRightLiftModel(
              labelName: 'Hip ER',
              controllerLeft: controlBodyFunction.hipERLeft,
              controllerRight: controlBodyFunction.hipERRight),
          TextFormFiledRightLiftModel(
              labelName: 'Quadriceps',
              controllerLeft: controlBodyFunction.quadricepsLeft,
              controllerRight: controlBodyFunction.quadricepsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Hamstring',
              controllerLeft: controlBodyFunction.hamstringLeft,
              controllerRight: controlBodyFunction.hamstringRight),
          TextFormFiledRightLiftModel(
              labelName: 'Plantar flexors',
              controllerLeft: controlBodyFunction.plantarFlexorsLeft,
              controllerRight: controlBodyFunction.plantarFlexorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Dorsiflexors',
              controllerLeft: controlBodyFunction.dorsiflexorsLeft,
              controllerRight: controlBodyFunction.dorsiflexorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Shoulder flexors',
              controllerLeft: controlBodyFunction.shoulderFlexorsLeft,
              controllerRight: controlBodyFunction.shoulderFlexorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Shoulder Extensors',
              controllerLeft: controlBodyFunction.shoulderExtensorsLeft,
              controllerRight: controlBodyFunction.shoulderExtensorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Shoulder',
              controllerLeft: controlBodyFunction.shoulderLeft,
              controllerRight: controlBodyFunction.shoulderRight),
          TextFormFiledRightLiftModel(
              labelName: 'Shoulder IR',
              controllerLeft: controlBodyFunction.shoulderIRLeft,
              controllerRight: controlBodyFunction.shoulderIRRight),
          TextFormFiledRightLiftModel(
              labelName: 'Shoulder ER',
              controllerLeft: controlBodyFunction.shoulderERLeft,
              controllerRight: controlBodyFunction.shoulderERRight),
          TextFormFiledRightLiftModel(
              labelName: 'Elbow Flexors',
              controllerLeft: controlBodyFunction.elbowFlexorsLeft,
              controllerRight: controlBodyFunction.elbowFlexorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Elbow Extensors',
              controllerLeft: controlBodyFunction.elbowExtensorsLeft,
              controllerRight: controlBodyFunction.elbowExtensorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Wrist Flexors',
              controllerLeft: controlBodyFunction.wristFlexorsLeft,
              controllerRight: controlBodyFunction.wristFlexorsRight),
          TextFormFiledRightLiftModel(
              labelName: 'Wrist Extensors',
              controllerLeft: controlBodyFunction.wristExtensorsLeft,
              controllerRight: controlBodyFunction.wristExtensorsRight),
        ],
      ),
      TextFormFiledStepperModel(
          labelName: 'Muscle Tone',
          textEditingController: controlBodyFunction.muscleTon),
      BottomSheetFileAssModel(itemList: [
        TextFormFiledRightLiftModel(
            labelName: 'Adductors (Knee flexion)',
            controllerRight: controlBodyFunction.adductorsKneeFlexionTonRight,
            controllerLeft: controlBodyFunction.adductorsKneeFlexionTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Adductors (Knee Extension)',
            controllerRight: controlBodyFunction.adductorsKneeExtensionTonRight,
            controllerLeft: controlBodyFunction.adductorsKneeExtensionTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Illiospoas',
            controllerRight: controlBodyFunction.illiospoasTonRight,
            controllerLeft: controlBodyFunction.illiospoasTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Hip IR',
            controllerRight: controlBodyFunction.hipIRtonTonRight,
            controllerLeft: controlBodyFunction.hipIRtonTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Hip ER',
            controllerRight: controlBodyFunction.hipERtonTonRight,
            controllerLeft: controlBodyFunction.hipERtonTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Quadriceps',
            controllerRight: controlBodyFunction.quadricepsTonRight,
            controllerLeft: controlBodyFunction.quadricepsTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Hamstring',
            controllerRight: controlBodyFunction.hamstringTonRight,
            controllerLeft: controlBodyFunction.hamstringTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Gastrocnemius',
            controllerRight: controlBodyFunction.gastrocnemiusTonRight,
            controllerLeft: controlBodyFunction.gastrocnemiusTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Soleus',
            controllerRight: controlBodyFunction.soleusTonRight,
            controllerLeft: controlBodyFunction.soleusTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Tibialis Ant',
            controllerRight: controlBodyFunction.tibialisAntTonRight,
            controllerLeft: controlBodyFunction.tibialisAntTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Tibialis Post',
            controllerRight: controlBodyFunction.tibialisPostTonRight,
            controllerLeft: controlBodyFunction.tibialisPostTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Shoulder',
            controllerRight: controlBodyFunction.shoulderTonRight,
            controllerLeft: controlBodyFunction.shoulderTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Adductors',
            controllerRight: controlBodyFunction.adductorsTonRight,
            controllerLeft: controlBodyFunction.adductorsTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Shoulder ER',
            controllerRight: controlBodyFunction.shoulderERTonRight,
            controllerLeft: controlBodyFunction.shoulderERTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Shoulder IR',
            controllerRight: controlBodyFunction.shoulderIRTonRight,
            controllerLeft: controlBodyFunction.shoulderIRTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Elbow Flexors',
            controllerRight: controlBodyFunction.elbowFlexorsTonRight,
            controllerLeft: controlBodyFunction.elbowFlexorsTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Wrist Flexors',
            controllerRight: controlBodyFunction.wristFlexorsTonRight,
            controllerLeft: controlBodyFunction.wristFlexorsTonLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Finger Flexors',
            controllerRight: controlBodyFunction.fingerFlexorsTonRight,
            controllerLeft: controlBodyFunction.fingerFlexorsTonLeft),
      ], name: 'Muscle Tone'),
      DropdownButtonItemModel(
          labelName: 'Muscle Bulk',
          controller: controlBodyFunction.muscleBulk,
          itemList: ['Atrophy', 'Less than normal', 'Normal', 'speudo trophy'])
    ];
    listlevelOfSelctivity = [
      DropdownButtonItemModel(
          controller: controlBodyFunction.upperLimb,
          labelName: 'Upper limb',
          itemList: const ['No', 'Poor', 'Moderate', 'Normal']),
      DropdownButtonItemModel(
          controller: controlBodyFunction.lowerLimb,
          labelName: 'Lower limb ',
          itemList: const ['No', 'Poor', 'Moderate', 'Normal']),
      BottomSheetFileAssModel(itemList: [
        TextFormFiledRightLiftModel(
            labelName: 'Gluteal',
            controllerRight: controlBodyFunction.glutealMuscleRight,
            controllerLeft: controlBodyFunction.glutealMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Abductors',
            controllerRight: controlBodyFunction.abductorsMuscleRight,
            controllerLeft: controlBodyFunction.abductorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Addoctors',
            controllerRight: controlBodyFunction.adductorsMuscleRight,
            controllerLeft: controlBodyFunction.adductorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Hip flexors',
            controllerRight: controlBodyFunction.hipFlexorsMuscleRight,
            controllerLeft: controlBodyFunction.hipFlexorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Quadriceps',
            controllerRight: controlBodyFunction.quadricepsMuscleRight,
            controllerLeft: controlBodyFunction.quadricepsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Hamstring',
            controllerRight: controlBodyFunction.hamstringMuscleRight,
            controllerLeft: controlBodyFunction.hamstringMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Planter flexors',
            controllerRight: controlBodyFunction.planterFlexorsMuscleRight,
            controllerLeft: controlBodyFunction.planterFlexorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Dorsiflexors',
            controllerRight: controlBodyFunction.dorsiflexorsMuscleRight,
            controllerLeft: controlBodyFunction.dorsiflexorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Shoulder flexors',
            controllerRight: controlBodyFunction.shoulderFlexorsMuscleRight,
            controllerLeft: controlBodyFunction.shoulderFlexorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Shoulder Extensors',
            controllerRight: controlBodyFunction.shoulderExtensorsMuscleRight,
            controllerLeft: controlBodyFunction.shoulderExtensorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Shoulder Abductors',
            controllerRight: controlBodyFunction.shoulderAbductorsMuscleRight,
            controllerLeft: controlBodyFunction.shoulderAbductorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Elbow Flexors',
            controllerRight: controlBodyFunction.elbowFlexorsMuscleRight,
            controllerLeft: controlBodyFunction.elbowFlexorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Elbow Extensors',
            controllerRight: controlBodyFunction.elbowExtensorsMuscleRight,
            controllerLeft: controlBodyFunction.elbowExtensorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Wrist Flexors',
            controllerRight: controlBodyFunction.wristFlexorsMuscleRight,
            controllerLeft: controlBodyFunction.wristFlexorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Wrist Extensors',
            controllerRight: controlBodyFunction.wristExtensorsMuscleRight,
            controllerLeft: controlBodyFunction.wristExtensorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Finger Flexors',
            controllerRight: controlBodyFunction.fingerFlexorsMuscleRight,
            controllerLeft: controlBodyFunction.fingerFlexorsMuscleLeft),
        TextFormFiledRightLiftModel(
            labelName: 'Finger Extensors',
            controllerRight: controlBodyFunction.fingerExtensorsMuscleRight,
            controllerLeft: controlBodyFunction.fingerExtensorsMuscleLeft),
      ], name: 'Muscle'),
    ];
    listMuscloskelton = [
      TextFormFiledStepperModel(
          labelName: 'Deformities',
          textEditingController: controlBodyFunction.deformities),
      DividerFileAssModel(text: 'Posture And Alignment'),
      TextFormFiledStepperModel(
          labelName: 'From Sitting',
          textEditingController: controlBodyFunction.fromSitting),
      TextFormFiledStepperModel(
          labelName: 'From Standing',
          textEditingController: controlBodyFunction.fromStanding),
      TextFormFiledStepperModel(
          labelName: 'Spine', textEditingController: controlBodyFunction.spine),
      TextFormFiledStepperModel(
          labelName: 'Pelvic',
          textEditingController: controlBodyFunction.pelvic),
      TextFormFiledStepperModel(
          labelName: 'Leg Length Discrepancy ',
          textEditingController: controlBodyFunction.legLengthDiscrepancy),
      DividerFileAssModel(text: 'Hip'),
      DropdownButtonItemModel(
          controller: controlBodyFunction.rt,
          labelName: 'Right',
          itemList: const ['Normal', 'In risk', 'Sublaxed', 'dislocated']),
      DropdownButtonItemModel(
          controller: controlBodyFunction.lf,
          labelName: 'Left',
          itemList: const ['Normal', 'In risk', 'Sublaxed', 'dislocated'])
    ];
    listRom = [
      DropdownButtonItemModel(
        controller: controlBodyFunction.hip,
        labelName: 'Hip',
        itemList: const ['restricted', 'Normal', 'hyper', 'flexibility'],
      ),
      DropdownButtonItemModel(
          controller: controlBodyFunction.knee,
          labelName: 'Knee',
          itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
      DropdownButtonItemModel(
          controller: controlBodyFunction.ankle,
          labelName: 'Ankle',
          itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
      DropdownButtonItemModel(
          controller: controlBodyFunction.shoulder,
          labelName: 'shoulder',
          itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
      DropdownButtonItemModel(
          controller: controlBodyFunction.elbow,
          labelName: 'elbow',
          itemList: const ['restricted', 'Normal', 'hyper', 'flexibility']),
      TextFormFiledStepperModel(
          labelName: 'Note', textEditingController: controlBodyFunction.note),
    ];
    listParticipation = [
      TextFormFiledStepperModel(
          labelName: 'Activity and Activity Limitation',
          textEditingController: controlActivityAndActivityLimitation
              .activityAndActivityLimitation),
      TextFormFiledStepperModel(
          labelName: 'Participation And Participation Restriction',
          textEditingController: controlActivityAndActivityLimitation
              .participationAndParticipationRestriction),
    ];
    listGoal = [
      TextFormFiledStepperModel(
          labelName: 'Short Goal',
          textEditingController: controlGoalsAndNote.shortGoals),
      TextFormFiledStepperModel(
          labelName: 'Long Goal',
          textEditingController: controlGoalsAndNote.longGoals),
      TextFormFiledStepperModel(
          labelName: 'Note', textEditingController: controlGoalsAndNote.note),
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