import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/cubit/tretment_plan_cubit.dart';
import 'package:manaber/features/doctor/profile_pationt/video/cubit/video_play_cubit.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import '../../conversational/conversational_view/view.dart';
import '../../conversational/stepper/controler.dart';
import '../../file_assa/info_view/view.dart';
import '../../file_assa/stpper/controller.dart';
import '../../occupation_therapy/info_occupation_view/view.dart';
import '../../occupation_therapy/stepper/controler.dart';
import 'widget/slection_item_profile.dart';
import '../tretment_plan/view.dart';
import '../video/view.dart';
import '../x-ray/view.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/images.dart';

class ProfilePationtScreen extends StatefulWidget {
  const ProfilePationtScreen(
      {super.key, required this.department, required this.id});
  final String department;
  final id;

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

  final ControleConversational controleConversational =
      ControleConversational();

  final ControleFileAssesment controleFileAssesment = ControleFileAssesment();
  final ControleOccupation controleOccupation = ControleOccupation();
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
                      widget.department == AppConstKey.physicalTherapy
                          ? navigateTo(
                              context,
                              FileAssassemntView(
                                  control: control,
                                  controlBodyFunction: controlBodyFunction,
                                  controlGoalsAndNote: controlGoalsAndNote,
                                  controlActivityAndActivityLimitation:
                                      controlActivityAndActivityLimitation))
                          : widget.department == AppConstKey.occupationalTherapy
                              ? navigateTo(
                                  context,
                                  InfoOccupationScreen(
                                    controleOccupation: controleOccupation,
                                  ))
                              : navigateTo(
                                  context,
                                  InfoConversationScreen(
                                    controleConversational:
                                        controleConversational,
                                  ));
                    },
                    sectionname: widget.department ==
                            AppConstKey.physicalTherapy
                        ? 'File assessment'
                        : widget.department == AppConstKey.occupationalTherapy
                            ? "Occupation "
                            : "تعديل السلوك",
                    image: widget.department == AppConstKey.physicalTherapy
                        ? AppImages.fileAssessment
                        : widget.department == AppConstKey.occupationalTherapy
                            ? AppImages.occupationalTherapy
                            : AppImages.conversational),
                SlectedItemProfile(
                    onTap: () {
                      navigateTo(
                        context,
                        BlocProvider(
                          create: (context) => TretmentPlanCubit(),
                          child: TretmentPlanView(
                            id: widget.id,
                          ),
                        ),
                      );
                    },
                    sectionname: 'Treatment plan',
                    image: AppImages.tretmentPlan),
                SlectedItemProfile(
                    onTap: () {
                      navigateTo(
                        context,
                        BlocProvider(
                          create: (context) => VideoPlayCubit(),
                          child: VideoScreen(
                            id: widget.id,
                          ),
                        ),
                      );
                    },
                    sectionname: 'Videos',
                    image: AppImages.video),
                widget.department == AppConstKey.speechTherapy
                    ? SizedBox.fromSize()
                    : SlectedItemProfile(
                        onTap: () {
                          navigateTo(
                              context,
                              XrayView(
                                id: widget.id,
                              ));
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
