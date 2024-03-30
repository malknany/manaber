import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../form_medical/conversational/conversational_view/view.dart';
import '../../form_medical/conversational/stepper/controler.dart';
import '../../form_medical/cubit/pateint_info_cubit.dart';
import '../tretment_plan/cubit/tretment_plan_cubit.dart';
import '../video/cubit/video_play_cubit.dart';
import '../x-ray/cubit/xray_cubit.dart';
import '../../../../shared/network/local/const_key.dart';

import '../../form_medical/file_assa/info_view/view.dart';
import '../../form_medical/file_assa/stpper/controller.dart';
import '../../form_medical/occupation_therapy/info_occupation_view/view.dart';
import '../../form_medical/occupation_therapy/stepper/controler.dart';
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
  final String id;

  @override
  State<ProfilePationtScreen> createState() => _ProfilePationtScreenState();
}

class _ProfilePationtScreenState extends State<ProfilePationtScreen> {
  final ControlConversational controleConversational =
      ControlConversational();

  final ControlFileAssessment controleFileAssesment = ControlFileAssessment();
  final ControlOccupation controleOccupation = ControlOccupation();
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
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 30),
              children: [
                SlectedItemProfile(
                    onTap: () {
                      widget.department == AppConstKey.physicalTherapy
                          ? navigateTo(
                              context,
                              BlocProvider(
                                create: (context) => PatientInfoCubit(),
                                child: FileAssassemntView(
                                  controleFileAssesment: controleFileAssesment,
                                  id: widget.id,
                                ),
                              ))
                          : widget.department == AppConstKey.occupationalTherapy
                              ? navigateTo(
                                  context,
                                  BlocProvider(
                                    create: (context) => PatientInfoCubit(),
                                    child: InfoOccupationScreen(
                                      id: widget.id,
                                      controleOccupation: controleOccupation,
                                    ),
                                  ))
                              : navigateTo(
                                  context,
                                  BlocProvider(
                                    create: (context) => PatientInfoCubit(),
                                    child: InfoConversationScreen(
                                      id: widget.id,
                                      controleConversational:
                                          controleConversational,
                                    ),
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
                          create: (context) => TreatmentPlanCubit(),
                          child: TretmentPlanView(
                            id: widget.id,
                          ),
                        ),
                      );
                    },
                    sectionname: 'Treatment plan',
                    image: AppImages.treatmentPlan),
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
                              BlocProvider(
                                create: (context) => XrayCubit(),
                                child: XrayView(
                                  id: widget.id,
                                ),
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
