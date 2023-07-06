import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/conversational_view/view.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/features/doctor/file_assa/info_view/view.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/view.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/features/doctor/profile_pationt/profile_view/widget/slection_item_profile.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/view.dart';
import 'package:manaber/features/doctor/profile_pationt/video/view.dart';
import 'package:manaber/features/doctor/profile_pationt/x-ray/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/images.dart';

class ProfilePationtScreen extends StatefulWidget {
  const ProfilePationtScreen({super.key, required this.index});
  final int index;

  @override
  State<ProfilePationtScreen> createState() => _ProfilePationtScreenState();
}

class _ProfilePationtScreenState extends State<ProfilePationtScreen> {
  // ? controles of file assessment
  final StepperControlPatientInfo control = StepperControlPatientInfo();
  final StepperControlBodyFunction controlBodyFunction =
      StepperControlBodyFunction();
  final StepperControlActivityAndActivityLimitation
      controlActivityAndActivityLimitation =
      StepperControlActivityAndActivityLimitation();
  final StepperControlGoalsAndNote controlGoalsAndNote =
      StepperControlGoalsAndNote();
  //? controle of occupation file
  final StepperPersonalHistory controlerPersonal = StepperPersonalHistory();
  final StepperBodyFunctionStrucer controlerBodyFunctionStrucer =
      StepperBodyFunctionStrucer();
  final StepperAssociatedDisorders controlerAssociatedDisorders =
      StepperAssociatedDisorders();
  final StepperBehaviorADLS controlerBehaviorADLS = StepperBehaviorADLS();
  final StepperOccupationPreformance controlerOccupationPreformance =
      StepperOccupationPreformance();
  // ? control of conversation
  final StepperPersonalHistoryConversational personalHistoryConversational =
      StepperPersonalHistoryConversational();
  final StepperMedicalAndGeneticHistoryOfTheFamily
      controlerMedicalAndGeneticHistoryOfTheFamily =
      StepperMedicalAndGeneticHistoryOfTheFamily();
  final StepperChildMedicalAndMedicalHistory
      controlerChildMedicalAndMedicalHistory =
      StepperChildMedicalAndMedicalHistory();
  final StepperNoteConversation controleNoteConversation =
      StepperNoteConversation();
  final StepperChildDevelopmentalHistory controleChildDevelopmentalHistory =
      StepperChildDevelopmentalHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient profile'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GridView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              children: [
                SlectedItemProfile(
                    onTap: () {
                      if (widget.index == 0) {
                        navigateTo(
                            context,
                            FileAssassemntView(
                                control: control,
                                controlBodyFunction: controlBodyFunction,
                                controlGoalsAndNote: controlGoalsAndNote,
                                controlActivityAndActivityLimitation:
                                    controlActivityAndActivityLimitation));
                      } else if (widget.index == 1) {
                        navigateTo(
                            context,
                            InfoOccupationScreen(
                                controleAssociatedDisorders:
                                    controlerAssociatedDisorders,
                                controleBehaviorADLS: controlerBehaviorADLS,
                                controleBodyFunctionStrucer:
                                    controlerBodyFunctionStrucer,
                                controleOccupationPreformance:
                                    controlerOccupationPreformance,
                                controlePersonalHistory: controlerPersonal));
                      } else {
                        navigateTo(
                            context,
                            InfoConversationScreen(
                                controlePersonalHistory:
                                    personalHistoryConversational,
                                controlerMedicalAndGeneticHistoryOfTheFamily:
                                    controlerMedicalAndGeneticHistoryOfTheFamily,
                                controleChildMedicalAndMedicalHistory:
                                    controlerChildMedicalAndMedicalHistory,
                                controlechildDevelopmentalHistory:
                                    controleChildDevelopmentalHistory,
                                controleNoteConversation:
                                    controleNoteConversation));
                      }
                    },
                    sectionname: widget.index == 0
                        ? 'File assessment'
                        : widget.index == 1
                            ? "Occupation "
                            : "تخاطب",
                    image: widget.index == 0
                        ? AppImages.fileAssessment
                        : widget.index == 1
                            ? AppImages.occupationalTherapy
                            : AppImages.conversational),
                SlectedItemProfile(
                    onTap: () {
                      navigateTo(context, const TretmentPlanView());
                    },
                    sectionname: 'Treatment plan',
                    image: AppImages.tretmentPlan),
                SlectedItemProfile(
                    onTap: () {
                      navigateTo(context, VideoScreen());
                    },
                    sectionname: 'Videos',
                    image: AppImages.video),
                widget.index == 2
                    ? SizedBox.fromSize()
                    : SlectedItemProfile(
                        onTap: () {
                          navigateTo(context, XrayView());
                        },
                        sectionname: 'X-rays',
                        image: AppImages.xRey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// List<String> profile = [
//   'File assessment',
//   'Treatment plan',
//   'x-rays',
//   'videos'
// ];
