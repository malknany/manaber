import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/shared/styles/styles.dart';
import 'widget/activity&activity.dart';
import 'widget/goalsview.dart';
import 'widget/icf_body.dart';
import 'widget/noteview.dart';
import 'widget/pationt_info_screen.dart';
import '../stpper/controller.dart';
import '../stpper/view.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/components/navigator.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/images.dart';

class FileAssassemntView extends StatefulWidget {
  const FileAssassemntView(
      {super.key,
      required this.id,
      required this.control,
      required this.controlBodyFunction,
      required this.controlGoalsAndNote,
      required this.controlActivityAndActivityLimitation,required this.controleFileAssesment});

  final StepperControlPatientInfo control;
  final StepperControlBodyFunction controlBodyFunction;
  final StepperControlGoalsAndNote controlGoalsAndNote;
  final StepperControlActivityAndActivityLimitation
      controlActivityAndActivityLimitation;
    final ControleFileAssesment controleFileAssesment;

  final String id;
  @override
  State<FileAssassemntView> createState() => _FileAssassemntViewState();
}

class _FileAssassemntViewState extends State<FileAssassemntView> {
  @override
  void initState() {
    BlocProvider.of<PateintInfoCubit>(context).getPatinetFromApi(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await navigateTo(
              context,
              FileStteper(
                controleFileAssesment:widget.controleFileAssesment ,
                  controle: widget.control,
                  controlBodyFunction: widget.controlBodyFunction,
                  controlActivityAndActivityLimitation:
                      widget.controlActivityAndActivityLimitation,
                  controlGoalsAndNote: widget.controlGoalsAndNote),
            );
            if (result == 'refresh') {
              setState(() {});
            }
          },
          backgroundColor: AppColors.primarycolor,
          elevation: 0,
          child: const Icon(Icons.edit_outlined)),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                BlocBuilder<PateintInfoCubit, PateintInfoState>(
                  builder: (context, state) {
                    if (state is PateintLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primarycolor),
                      );
                    }
                    if (state is PateintErrorMsg) {
                      return Center(
                        child: Text(
                          state.msg,
                          style: AppTextStyles.lrTitles
                              .copyWith(color: Colors.black),
                        ),
                      );
                    }
                    if (state is PateintSuccess) {
                      state.listOfInfoPatient;
                      return Column(
                        children: [
                          ButtonText(
                              text: 'Patient Information',
                              onPressed: () {
                                navigateTo(
                                    context,
                                    PatientInfoView(
                                      stepperControl: widget.control,
                                    ));
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'ICF Body function And structure',
                              onPressed: () {
                                navigateTo(
                                    context,
                                    ICFBodyView(
                                      controlBodyFunction:
                                          widget.controlBodyFunction,
                                    ));
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'Participation',
                              onPressed: () {
                                navigateTo(
                                    context,
                                    ActivityAndActivityLimitationView(
                                      controlActivityAndActivityLimitation: widget
                                          .controlActivityAndActivityLimitation,
                                    ));
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'Goals',
                              onPressed: () {
                                navigateTo(
                                    context,
                                    GoalsView(
                                      controlGoalsAndNote:
                                          widget.controlGoalsAndNote,
                                    ));
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'Note',
                              onPressed: () {
                                navigateTo(
                                    context,
                                    NoteView(
                                      controlGoalsAndNote:
                                          widget.controlGoalsAndNote,
                                    ));
                              },
                              borderRadius: 7),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: AppColors.primarycolor,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
