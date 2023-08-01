import 'package:flutter/material.dart';
import '../../stpper/controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';

class ICFBodyView extends StatelessWidget {
  const ICFBodyView({super.key, required this.controlBodyFunction});
  final StepperControlBodyFunction controlBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Body function',
            style: TextStyle(
              color: AppColors.primarycolor,
            )),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Image.asset(AppImages.fileAssessment)),
                  const Text(
                    "File Assessment",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "All information about Patient",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 16.0),
                  InfoRowItem(
                      title: "Mental status",
                      value: controlBodyFunction.mentalStatus.text),
                  InfoRowItem(
                      title: "Voice Speech ",
                      value: controlBodyFunction.voiceSpeech.text),
                  InfoRowItem(
                      title: "Function of metabolic and endocrine",
                      value: controlBodyFunction
                          .functionOfMetabolicAndEndocrine.text),
                  InfoRowItem(
                      title: "Function of Cardiovascular",
                      value: controlBodyFunction
                          .functionOfCardiovascularRespiration.text),
                  const Text('Sensory Examination',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: "Superficial",
                      value: controlBodyFunction.superficial.text),
                  InfoRowItem(
                      title: "Vestibular",
                      value: controlBodyFunction.vestibular.text),
                  InfoRowItem(
                      title: "Proprioception",
                      value: controlBodyFunction.proprioception.text),
                  InfoRowItem(
                      title: "Tactile",
                      value: controlBodyFunction.tactile.text),
                  const Text('GaiT Problems ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: "Note", value: controlBodyFunction.gaitnote.text),
                  InfoRowItem(
                      title: "Stance phase",
                      value: controlBodyFunction.stancePhase.text),
                  InfoRowItem(
                      title: "Swing phase",
                      value: controlBodyFunction.swingPhase.text),
                  InfoRowItem(
                      title: "Balance",
                      value: controlBodyFunction.balance.text),
                  const Text('Developmental Milestones ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: "Head control",
                      value: controlBodyFunction.headControl.text),
                  InfoRowItem(
                      title: "Rolling",
                      value: controlBodyFunction.rolling.text),
                  InfoRowItem(
                      title: "Creeping",
                      value: controlBodyFunction.creeping.text),
                  InfoRowItem(
                      title: "Crawling",
                      value: controlBodyFunction.crawling.text),
                  InfoRowItem(
                      title: "Sitting",
                      value: controlBodyFunction.sitting.text),
                  InfoRowItem(
                      title: "Standing",
                      value: controlBodyFunction.standing.text),
                  InfoRowItem(
                      title: "Walking",
                      value: controlBodyFunction.walking.text),
                  InfoRowItem(
                      title: "Fine Motor Function (Hand Function)",
                      value: controlBodyFunction
                          .fineMotorFunctionHandFunction.text),
                  const Text('Neurological Examination',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: "Vision", value: controlBodyFunction.vision.text),
                  InfoRowItem(
                      title: "Hearing",
                      value: controlBodyFunction.hearing.text),
                  InfoRowItem(
                      title: "involantary movment",
                      value: controlBodyFunction.involantaryMovment.text),
                  const Text('Primitive Reflexese ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: "Palmar reflex",
                      value: controlBodyFunction.palmarReflex.text),
                  InfoRowItem(
                      title: "Planter reflex",
                      value: controlBodyFunction.planterReflex.text),
                  InfoRowItem(
                      title: "Rooting reflex",
                      value: controlBodyFunction.rootingReflex.text),
                  InfoRowItem(
                      title: "Sucking reflex",
                      value: controlBodyFunction.suckingReflex.text),
                  InfoRowItem(
                      title: "Supine labyrinthine",
                      value: controlBodyFunction.supineLabyrinthine.text),
                  InfoRowItem(
                      title: "Prone labyrinthine",
                      value: controlBodyFunction.proneLabyrinthine.text),
                  InfoRowItem(
                      title: "Symmetrical tonic neck reflex",
                      value:
                          controlBodyFunction.symmetricalTonicNeckReflex.text),
                  InfoRowItem(
                      title: "Asymmetrical tonic neck reflex",
                      value:
                          controlBodyFunction.asymmetricalTonicNeckReflex.text),
                  InfoRowItem(
                      title: "Foot-hand replacement",
                      value: controlBodyFunction.footHandReplacement.text),
                  InfoRowItem(
                      title: "Moro reflex",
                      value: controlBodyFunction.moroReflex.text),
                  InfoRowItem(
                      title: "Landau reflex",
                      value: controlBodyFunction.landauReflex.text),
                  const Text('Advanced Reflex ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: "Protective",
                      value: controlBodyFunction.protective.text),
                  InfoRowItem(
                      title: "Righting and Equilibrium reflex",
                      value: controlBodyFunction
                          .rightingAndEquilibriumReflex.text),
                  const Text('Muscle strength',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  RowItemRightLeft(
                      right: controlBodyFunction.glutealRight.text,
                      left: controlBodyFunction.glutealLeft.text,
                      title: 'Gluteal'),
                  RowItemRightLeft(
                      right: controlBodyFunction.abductorsRight.text,
                      left: controlBodyFunction.abductorsLeft.text,
                      title: 'Abductors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.adductorsRight.text,
                      left: controlBodyFunction.adductorsLeft.text,
                      title: 'Adductors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hipFlexorsRight.text,
                      left: controlBodyFunction.hipFlexorsLeft.text,
                      title: 'Hip flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hipIRRight.text,
                      left: controlBodyFunction.hipIRLeft.text,
                      title: 'Hip IR'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hipERRight.text,
                      left: controlBodyFunction.hipERLeft.text,
                      title: 'Hip ER'),
                  RowItemRightLeft(
                      right: controlBodyFunction.quadricepsRight.text,
                      left: controlBodyFunction.quadricepsLeft.text,
                      title: 'Quadriceps'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hamstringRight.text,
                      left: controlBodyFunction.hamstringLeft.text,
                      title: 'Hamstring'),
                  RowItemRightLeft(
                      right: controlBodyFunction.plantarFlexorsRight.text,
                      left: controlBodyFunction.plantarFlexorsLeft.text,
                      title: 'Plantar flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.dorsiflexorsRight.text,
                      left: controlBodyFunction.dorsiflexorsLeft.text,
                      title: 'Dorsiflexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderFlexorsRight.text,
                      left: controlBodyFunction.shoulderFlexorsLeft.text,
                      title: 'Shoulder flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderExtensorsRight.text,
                      left: controlBodyFunction.shoulderExtensorsLeft.text,
                      title: 'Shoulder Extensors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderRight.text,
                      left: controlBodyFunction.shoulderLeft.text,
                      title: 'Shoulder'),
                  // RowItemRightLeft(
                  //     right: controlBodyFunction.abductorsRight.text,
                  //     left: controlBodyFunction.abductorsLeft.text,
                  //     title: 'Abductors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderIRRight.text,
                      left: controlBodyFunction.shoulderIRLeft.text,
                      title: 'Shoulder IR'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderERRight.text,
                      left: controlBodyFunction.shoulderERLeft.text,
                      title: 'Shoulder ER'),
                  RowItemRightLeft(
                      right: controlBodyFunction.elbowFlexorsRight.text,
                      left: controlBodyFunction.elbowFlexorsLeft.text,
                      title: 'Elbow Flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.elbowExtensorsRight.text,
                      left: controlBodyFunction.elbowExtensorsLeft.text,
                      title: 'Elbow Extensors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.wristFlexorsRight.text,
                      left: controlBodyFunction.wristFlexorsLeft.text,
                      title: 'Wrist Flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.wristExtensorsRight.text,
                      left: controlBodyFunction.wristExtensorsLeft.text,
                      title: 'Wrist Extensors'),
                  InfoRowItem(
                      title: "Muscle Tone",
                      value: controlBodyFunction.muscleTon.text),
                  const Text('Muscle',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  RowItemRightLeft(
                      right:
                          controlBodyFunction.adductorsKneeFlexionTonRight.text,
                      left:
                          controlBodyFunction.adductorsKneeFlexionTonLeft.text,
                      title: 'Adductors (Knee flexion)'),
                  RowItemRightLeft(
                      right: controlBodyFunction
                          .adductorsKneeExtensionTonRight.text,
                      left: controlBodyFunction
                          .adductorsKneeExtensionTonLeft.text,
                      title: 'Adductors (Knee Extension)'),
                  RowItemRightLeft(
                      right: controlBodyFunction.illiospoasTonRight.text,
                      left: controlBodyFunction.illiospoasTonLeft.text,
                      title: 'Illiospoas'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hipIRtonTonRight.text,
                      left: controlBodyFunction.hipIRtonTonLeft.text,
                      title: 'Hip IR'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hipERtonTonRight.text,
                      left: controlBodyFunction.hipERtonTonLeft.text,
                      title: 'Hip ER'),
                  RowItemRightLeft(
                      right: controlBodyFunction.quadricepsTonRight.text,
                      left: controlBodyFunction.quadricepsTonLeft.text,
                      title: 'Quadriceps'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hamstringTonRight.text,
                      left: controlBodyFunction.hamstringTonLeft.text,
                      title: 'Hamstring'),
                  RowItemRightLeft(
                      right: controlBodyFunction.gastrocnemiusTonRight.text,
                      left: controlBodyFunction.gastrocnemiusTonLeft.text,
                      title: 'Gastrocnemius'),
                  RowItemRightLeft(
                      right: controlBodyFunction.soleusTonRight.text,
                      left: controlBodyFunction.soleusTonLeft.text,
                      title: 'Soleus'),
                  RowItemRightLeft(
                      right: controlBodyFunction.tibialisAntTonRight.text,
                      left: controlBodyFunction.tibialisAntTonLeft.text,
                      title: 'Tibialis Ant'),
                  RowItemRightLeft(
                      right: controlBodyFunction.tibialisPostTonRight.text,
                      left: controlBodyFunction.tibialisPostTonLeft.text,
                      title: 'Tibialis Post'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderTonRight.text,
                      left: controlBodyFunction.shoulderTonLeft.text,
                      title: 'Shoulder'),
                  RowItemRightLeft(
                      right: controlBodyFunction.adductorsTonRight.text,
                      left: controlBodyFunction.adductorsTonLeft.text,
                      title: 'Adductors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderIRTonRight.text,
                      left: controlBodyFunction.shoulderIRTonLeft.text,
                      title: 'Shoulder IR'),
                  RowItemRightLeft(
                      right: controlBodyFunction.shoulderERTonRight.text,
                      left: controlBodyFunction.shoulderERTonLeft.text,
                      title: 'Shoulder ER'),
                  RowItemRightLeft(
                      right: controlBodyFunction.elbowFlexorsTonRight.text,
                      left: controlBodyFunction.elbowFlexorsTonLeft.text,
                      title: 'Elbow Flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.wristFlexorsTonRight.text,
                      left: controlBodyFunction.wristFlexorsTonLeft.text,
                      title: 'Wrist Flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.fingerFlexorsTonRight.text,
                      left: controlBodyFunction.fingerFlexorsTonLeft.text,
                      title: 'Finger Flexors'),
                  InfoRowItem(
                      title: "Muscle Bulk",
                      value: controlBodyFunction.muscleBulk.text),
                  const Text('Level of Selectivity',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: "Upper limb",
                      value: controlBodyFunction.upperLimb.text),
                  InfoRowItem(
                      title: "Lower limb",
                      value: controlBodyFunction.lowerLimb.text),
                  const Text('Muscle',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  RowItemRightLeft(
                      right: controlBodyFunction.glutealMuscleRight.text,
                      left: controlBodyFunction.glutealMuscleLeft.text,
                      title: 'Gluteal'),
                  RowItemRightLeft(
                      right: controlBodyFunction.abductorsMuscleRight.text,
                      left: controlBodyFunction.abductorsMuscleLeft.text,
                      title: 'Abductors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.adductorsMuscleRight.text,
                      left: controlBodyFunction.adductorsMuscleLeft.text,
                      title: 'Adductors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hipFlexorsMuscleRight.text,
                      left: controlBodyFunction.hipFlexorsMuscleLeft.text,
                      title: 'Hip flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.quadricepsMuscleRight.text,
                      left: controlBodyFunction.quadricepsMuscleLeft.text,
                      title: 'Quadriceps'),
                  RowItemRightLeft(
                      right: controlBodyFunction.hamstringMuscleRight.text,
                      left: controlBodyFunction.hamstringMuscleLeft.text,
                      title: 'Hamstring'),
                  RowItemRightLeft(
                      right: controlBodyFunction.planterFlexorsMuscleRight.text,
                      left: controlBodyFunction.planterFlexorsMuscleLeft.text,
                      title: 'Planter flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.dorsiflexorsMuscleRight.text,
                      left: controlBodyFunction.dorsiflexorsMuscleLeft.text,
                      title: 'Dorsiflexors'),
                  RowItemRightLeft(
                      right:
                          controlBodyFunction.shoulderFlexorsMuscleRight.text,
                      left: controlBodyFunction.shoulderFlexorsMuscleLeft.text,
                      title: 'Shoulder flexors'),
                  RowItemRightLeft(
                      right:
                          controlBodyFunction.shoulderExtensorsMuscleRight.text,
                      left:
                          controlBodyFunction.shoulderExtensorsMuscleLeft.text,
                      title: 'Shoulder Extensors'),
                  RowItemRightLeft(
                      right:
                          controlBodyFunction.shoulderAbductorsMuscleRight.text,
                      left:
                          controlBodyFunction.shoulderAbductorsMuscleLeft.text,
                      title: 'Shoulder Abductors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.elbowFlexorsMuscleRight.text,
                      left: controlBodyFunction.elbowFlexorsMuscleLeft.text,
                      title: 'Elbow Flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.elbowExtensorsMuscleRight.text,
                      left: controlBodyFunction.elbowExtensorsMuscleLeft.text,
                      title: 'Elbow Extensors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.wristFlexorsMuscleRight.text,
                      left: controlBodyFunction.wristFlexorsMuscleLeft.text,
                      title: 'Wrist Flexors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.wristExtensorsMuscleRight.text,
                      left: controlBodyFunction.wristExtensorsMuscleLeft.text,
                      title: 'Wrist Extensors'),
                  RowItemRightLeft(
                      right: controlBodyFunction.fingerFlexorsMuscleRight.text,
                      left: controlBodyFunction.fingerFlexorsMuscleLeft.text,
                      title: 'Finger Flexors'),
                  RowItemRightLeft(
                      right:
                          controlBodyFunction.fingerExtensorsMuscleRight.text,
                      left: controlBodyFunction.fingerExtensorsMuscleLeft.text,
                      title: 'Finger Extensors'),
                  const Text('Rom',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: 'Hip', value: controlBodyFunction.hip.text),
                  InfoRowItem(
                      title: 'knee', value: controlBodyFunction.knee.text),
                  InfoRowItem(
                      title: 'Ankle', value: controlBodyFunction.ankle.text),
                  InfoRowItem(
                      title: 'shoulder',
                      value: controlBodyFunction.shoulder.text),
                  InfoRowItem(
                      title: 'elbow', value: controlBodyFunction.elbow.text),
                  InfoRowItem(
                      title: 'note', value: controlBodyFunction.note.text),
                  InfoRowItem(
                      title: 'Deformities',
                      value: controlBodyFunction.deformities.text),
                  const Text('Posture And Alignment',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(
                      title: 'From Sitting',
                      value: controlBodyFunction.fromSitting.text),
                  InfoRowItem(
                      title: 'Spine', value: controlBodyFunction.spine.text),
                  InfoRowItem(
                      title: 'Pelvic', value: controlBodyFunction.pelvic.text),
                  InfoRowItem(
                      title: 'Leg Length Discrepancy',
                      value: controlBodyFunction.legLengthDiscrepancy.text),
                  const Text('Hip',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  InfoRowItem(title: 'Rt', value: controlBodyFunction.rt.text),
                  InfoRowItem(title: 'Lf', value: controlBodyFunction.lf.text),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
