import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/info_view/widget/data_intry_reception.dart';
import 'package:manaber/features/doctor/members/model.dart';
import '../../cubit/pateint_info_cubit.dart';
import '../../model.dart';
import '../../../../../shared/styles/styles.dart';
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
      {super.key, required this.id, required this.controleFileAssesment,required this.patientInfo});

  final ControleFileAssesment controleFileAssesment;
  final Patient patientInfo;

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
                listOfInfoFileAssessment:
                    BlocProvider.of<PateintInfoCubit>(context)
                        .listOfInfoPatient,
                id: widget.id,
                controleFileAssesment: widget.controleFileAssesment,
              ),
            );
            if (result == 'refresh') {
              BlocProvider.of<PateintInfoCubit>(context)
                  .getPatinetFromApi(widget.id);
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
            child: Row(
              children: [
                Expanded(child: Image.asset(AppImages.fileAssessment)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                            final List<ModelPatientInfo> personalHistory = [];
                            final List<ModelPatientInfo> iCFBodyFunction = [];
                            final List<ModelPatientInfo> activity = [];
                            final List<ModelPatientInfo> goals = [];
                            final List<ModelPatientInfo> note = [];
                            for (final person in state.listOfInfoPatient) {
                              if (person.section == 'Patient Information') {
                                personalHistory.add(person);
                              }
                              if (person.section ==
                                      'ICF Body Function and Structure' ||
                                  person.section ==
                                      'Neurological Examination' ||
                                  person.section == 'Motor System' ||
                                  person.section == 'Rom' ||
                                  person.section == 'Level of Selectivity' ||
                                  person.section ==
                                      'Muscloskeletal Examination') {
                                iCFBodyFunction.add(person);
                              }
                              if (person.section == 'Activity') {
                                activity.add(person);
                              }
                              if (person.section == 'Goals') {
                                goals.add(person);
                              }

                              if (person.section == 'Note') {
                                note.add(person);
                              }
                            }
                            return Column(
                              children: [
                                ButtonText(
                                    text: 'Patient Information',
                                    onPressed: () {
                                      navigateTo(
                                        context,
                                        PatientInfoView(
                                          personalHistory: personalHistory,
                                        ),
                                      );
                                    },
                                    borderRadius: 7),
                                ButtonText(
                                    text: 'ICF Body function And structure',
                                    onPressed: () {
                                      navigateTo(
                                        context,
                                        ICFBodyView(
                                          iCFBodyFunction: iCFBodyFunction,
                                        ),
                                      );
                                    },
                                    borderRadius: 7),
                                ButtonText(
                                    text: 'Participation',
                                    onPressed: () {
                                      navigateTo(
                                        context,
                                        ActivityAndActivityLimitationView(
                                          activity: activity,
                                        ),
                                      );
                                    },
                                    borderRadius: 7),
                                ButtonText(
                                    text: 'Goals',
                                    onPressed: () {
                                      navigateTo(
                                        context,
                                        GoalsView(
                                          goals: goals,
                                        ),
                                      );
                                    },
                                    borderRadius: 7),
                                ButtonText(
                                  text: 'Note',
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      NoteView(
                                        note: note,
                                      ),
                                    );
                                  },
                                  borderRadius: 7,
                                ),
                                ButtonText(
                                  text: 'Data receptionist',
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      DataIntryFromReception(patientInfo: widget.patientInfo)
                                    );
                                  },
                                  borderRadius: 7,
                                ),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
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
