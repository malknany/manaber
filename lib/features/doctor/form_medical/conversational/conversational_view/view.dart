import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/pateint_info_cubit.dart';
import '../../model.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/components/navigator.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/images.dart';
import '../../../../../shared/styles/styles.dart';
import 'widget/child_developmental_history_view.dart';
import 'widget/child_medical_and_medical_history_view.dart';
import 'widget/medical_genetic_history_of_family_view.dart';
import 'widget/note_conversationl_view.dart';
import 'widget/personal_history_conversationl.dart';
import '../stepper/controler.dart';
import '../stepper/view.dart';

class InfoConversationScreen extends StatefulWidget {
  const InfoConversationScreen({
    super.key,
    required this.controleConversational,
    required this.id,
  });

  final ControlConversational controleConversational;
  final String id;

  @override
  State<InfoConversationScreen> createState() => _InfoConversationScreenState();
}

class _InfoConversationScreenState extends State<InfoConversationScreen> {
  @override
  void initState() {
    BlocProvider.of<PatientInfoCubit>(context).getPatinetFromApi(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await navigateTo(
              context,
              StepperConversational(
                listOfModelPatenitInfo:
                    context.read<PatientInfoCubit>().listOfInfoPatient,
                id: widget.id,
                controleConversational: widget.controleConversational,
              ),
            );
            if (result == 'refresh') {
              BlocProvider.of<PatientInfoCubit>(context)
                  .getPatinetFromApi(widget.id);
            }
          },
          backgroundColor: AppColors.primaryColor,
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
                    child: Image.asset(AppImages.conversational1)),
                const Text(
                  " إستمارة دراسة حالة",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                BlocBuilder<PatientInfoCubit, PatientInfoState>(
                  builder: (context, state) {
                    if (state is PatientLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                      );
                    }
                    if (state is PatientErrorMsg) {
                      return Center(
                        child: Text(
                          state.msg,
                          style: AppTextStyles.lrTitles
                              .copyWith(color: Colors.black),
                        ),
                      );
                    }
                    if (state is PatientSuccess) {
                      final List<ModelPatientInfo> personalHistory = [];
                      final List<ModelPatientInfo> medicalGenetic = [];
                      final List<ModelPatientInfo> childMedical = [];
                      final List<ModelPatientInfo> childDevelopment = [];
                      final List<ModelPatientInfo> note = [];
                      for (final person in state.listOfInfoPatient) {
                        if (person.section == 'personal') {
                          personalHistory.add(person);
                        }
                        if (person.section == 'medical_genetic') {
                          medicalGenetic.add(person);
                        }
                        if (person.section == 'child_medical') {
                          childMedical.add(person);
                        }
                        if (person.section == 'child_development') {
                          childDevelopment.add(person);
                        }
                        if (person.section == 'note') {
                          note.add(person);
                        }
                      }
                      return Column(
                        children: [
                          ButtonText(
                              text: 'البیانات الأولیة',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  PersonalHistoryConversationalView(
                                    modelPersonalHistory: personalHistory,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'التاریخ المرضي والوراثي للعائلة',
                              onPressed: () {
                                navigateTo(
                                    context,
                                    MedicalAndGeneticHistoryOfTheFamilyView(
                                      modelMedicalAndGeneticHistory:
                                          medicalGenetic,
                                    ));
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'التاریخ الصحي والمرضي للطفل',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  ChildMedicalAndMedicalHistoryView(
                                    modelChildMedicalAndMedicalHistory:
                                        childMedical,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'تاریخ النمو التطوري للطفل',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  ChildDevelopmentalHistoryView(
                                    modelChildDevelopmentalHistory:
                                        childDevelopment,
                                  ),
                                );
                              },
                              borderRadius: 7),
                          ButtonText(
                              text: 'ملاحظات',
                              onPressed: () {
                                navigateTo(
                                  context,
                                  NoteConversationalView(
                                    modelNoteConversational: note,
                                  ),
                                );
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
