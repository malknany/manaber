import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/conversational_view/view.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/features/doctor/file_assa/info_view/view.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/features/doctor/occupation_therapy/info_occupation_view/view.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/features/doctor/our_sections/widgets/section_item.dart';
import 'package:manaber/features/doctor/profile_doctor/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class Oursectiosn extends StatelessWidget {
  Oursectiosn({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, const ProfileDoctor());
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('أقسامنا',
                  style: AppTextStyles.lrTitles.copyWith(fontSize: 32)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () => navigateTo(
                          context,
                          FileAssassemntScreen(
                            controlActivityAndActivityLimitation:
                                controlActivityAndActivityLimitation,
                            controlGoalsAndNote: controlGoalsAndNote,
                            controlBodyFunction: controlBodyFunction,
                            control: control,
                          )),
                      child: const SectionItem(
                        sectionname: 'العلاج الطبيعي',
                        image: AppImages.occupationalTherapy,
                      )),
                  InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            InfoOccupationScreen(
                              controleAssociatedDisorders:
                                  controlerAssociatedDisorders,
                              controlePersonalHistory: controlerPersonal,
                              controleBehaviorADLS: controlerBehaviorADLS,
                              controleBodyFunctionStrucer:
                                  controlerBodyFunctionStrucer,
                              controleOccupationPreformance:
                                  controlerOccupationPreformance,
                            ));
                      },
                      child: const SectionItem(
                        sectionname: 'العلاج الوظيفي',
                        image: AppImages.naturalTherapy,
                      )),
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        InfoConversationScreen(
                          controleChildMedicalAndMedicalHistory:
                              controlerChildMedicalAndMedicalHistory,
                          controleNoteConversation: controleNoteConversation,
                          controlechildDevelopmentalHistory:
                              controleChildDevelopmentalHistory,
                          controlerMedicalAndGeneticHistoryOfTheFamily:
                              controlerMedicalAndGeneticHistoryOfTheFamily,
                          controlePersonalHistory:
                              personalHistoryConversational,
                        ),
                      );
                    },
                    child: const SectionItem(
                      sectionname: 'التخاطب',
                      image: AppImages.occupational,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
