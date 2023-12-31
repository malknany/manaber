import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/members/model.dart';
import 'package:manaber/features/doctor/profile_pationt/last_ressessment/cubit/Last_reassessment_cubit.dart';
import 'package:manaber/features/doctor/profile_pationt/last_ressessment/view.dart';
import '../../form_medical/conversational/conversational_view/view.dart';
import '../../form_medical/conversational/stepper/controler.dart';
import '../../form_medical/cubit/pateint_info_cubit.dart';
import '../tretment_plan/cubit/tretment_plan_cubit.dart';
import '../../../../shared/network/local/const_key.dart';

import '../../form_medical/file_assa/info_view/view.dart';
import '../../form_medical/file_assa/stpper/controller.dart';
import '../../form_medical/occupation_therapy/info_occupation_view/view.dart';
import '../../form_medical/occupation_therapy/stepper/controler.dart';
import 'widget/slection_item_profile.dart';
import '../tretment_plan/view.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/images.dart';

class ProfilePationtScreen extends StatefulWidget {
  const ProfilePationtScreen(
      {super.key, required this.department, required this.id,required this.pateintInfo});
  final String department;
  final String id;
  final Patient pateintInfo;

  @override
  State<ProfilePationtScreen> createState() => _ProfilePationtScreenState();
}

class _ProfilePationtScreenState extends State<ProfilePationtScreen> {
  final ControleConversational controleConversational =
      ControleConversational();

  final ControleFileAssesment controlFileAssesment = ControleFileAssesment();
  final ControleOccupation controlOccupation = ControleOccupation();
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
                                create: (context) => PateintInfoCubit(),
                                child: FileAssassemntView(
                                  patientInfo: widget.pateintInfo,
                                  controleFileAssesment: controlFileAssesment,
                                  id: widget.id,
                                ),
                              ))
                          : widget.department == AppConstKey.occupationalTherapy
                              ? navigateTo(
                                  context,
                                  BlocProvider(
                                    create: (context) => PateintInfoCubit(),
                                    child: InfoOccupationScreen(
                                      patientInfo: widget.pateintInfo,
                                      id: widget.id,
                                      controleOccupation: controlOccupation,
                                    ),
                                  ))
                              : navigateTo(
                                  context,
                                  BlocProvider(
                                    create: (context) => PateintInfoCubit(),
                                    child: InfoConversationScreen(
                                      patientInfo: widget.pateintInfo,
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
                        create: (context) => TretmentPlanCubit(),
                        child: TretmentPlanView(
                          id: widget.id,
                        ),
                      ),
                    );
                  },
                  sectionname: 'Treatment plan',
                  image: AppImages.tretmentPlan,
                ),
                SlectedItemProfile(
                  onTap: () {
                    navigateTo(
                      context ,

                      BlocProvider(
                        create: (context) => LastReassessmentCubit(),
                        child: LastReassessmentView(
                          id: widget.id,
                        ),
                      ),
                    );
                  },
                  sectionname: 'Last Reassessment',
                  image: AppImages.lastReassessment,
                ),
                // SlectedItemProfile(
                //     onTap: () {
                //       navigateTo(
                //         context,
                //         BlocProvider(
                //           create: (context) => VideoPlayCubit(),
                //           child: VideoScreen(
                //             id: widget.id,
                //           ),
                //         ),
                //       );
                //     },
                //     sectionname: 'Videos',
                //     image: AppImages.video),
                // widget.department == AppConstKey.speechTherapy
                //     ? SizedBox.fromSize()
                //     : SlectedItemProfile(
                //         onTap: () {
                //           navigateTo(
                //               context,
                //               BlocProvider(
                //                 create: (context) => XrayCubit(),
                //                 child: XrayView(
                //                   id: widget.id,
                //                 ),
                //               ));
                //         },
                //         sectionname: 'X-rays',
                //         image: AppImages.xRey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
