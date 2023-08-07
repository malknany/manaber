import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/shared/styles/styles.dart';
import 'widget/BehaviorADLS_view.dart';
import 'widget/Occupational_perform_view.dart';
import 'widget/associated_disorders_view.dart';
import 'widget/body_function_view.dart';
import 'widget/note_occupation_view.dart';
import 'widget/personal_history.dart';
import '../stepper/controler.dart';
import '../stepper/view.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/components/navigator.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/images.dart';

class InfoOccupationScreen extends StatefulWidget {
  const InfoOccupationScreen({
    super.key,
    required this.controleOccupation,
    required this.id,
  });
  final ControleOccupation controleOccupation;
  final String id;

  @override
  State<InfoOccupationScreen> createState() => _InfoOccupationScreenState();
}

class _InfoOccupationScreenState extends State<InfoOccupationScreen> {
  @override
  void initState() {
    BlocProvider.of<PateintInfoCubit>(context).getPatinetFromApi(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primarycolor,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final resulte = await navigateTo(
                context,
                StepperOccupation(
                  listOfInfoPatient:
                      context.read<PateintInfoCubit>().listOfInfoPatient,
                  id: widget.id,
                  controleOccupation: widget.controleOccupation,
                ));
            if (resulte == 'refresh') {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.occupationalTherapy)),
                const Text(
                  "Occupational Therapy",
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
                      final List<ModelPatientInfo> associatedDisorders = [];
                      final List<ModelPatientInfo> bodyFunctionAndStrucer = [];
                      final List<ModelPatientInfo> behaviorAndADLS = [];
                      final List<ModelPatientInfo> note = [];
                      for (final person in state.listOfInfoPatient) {
                        if (person.section == 'Personal History') {
                          personalHistory.add(person);
                        }
                        if (person.section == 'Associated Disorders') {
                          associatedDisorders.add(person);
                        }
                        if (person.section == 'Body Function and Structure') {
                          bodyFunctionAndStrucer.add(person);
                        }
                        if (person.section == 'Behavior and ADLS') {
                          behaviorAndADLS.add(person);
                        }
                        if (person.section == 'Occupation Performance') {
                          note.add(person);
                        }
                      }
                      return Column(
                        children: [
                          ButtonText(
                              text: 'personal history',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  PersonalHistoryView(
                                    personalHistory: personalHistory,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'Associated disorders',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  AssociatedDisordersView(
                                    associatedDisorders: associatedDisorders,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'body function & strucer',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  BodyFunctionAndStrucerView(
                                    bodyFunctionAndStrucer:
                                        bodyFunctionAndStrucer,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'Behavior & A.D.L.S',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  BehaviorADLSView(
                                    behaviorADLS: behaviorAndADLS,
                                    // controleOccupation:
                                    //     widget.controleOccupation,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'Occupational performance',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  OccupationalPerformanceView(
                                    occupationalPerformance: note,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'Note',
                              onPressed: () {
                                navigateTo(
                                    context,
                                    NoteOccupationalView(
                                      noteOccupational: note,
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
    );
  }
}
