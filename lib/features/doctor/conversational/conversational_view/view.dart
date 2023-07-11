import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/conversational_view/widget/child_developmental_history_view.dart';
import 'package:manaber/features/doctor/conversational/conversational_view/widget/child_medical_and_medical_history_view.dart';
import 'package:manaber/features/doctor/conversational/conversational_view/widget/medical_genetic_history_of_family_view.dart';
import 'package:manaber/features/doctor/conversational/conversational_view/widget/note_conversationl_view.dart';
import 'package:manaber/features/doctor/conversational/conversational_view/widget/personal_history_conversationl.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/features/doctor/conversational/stepper/view.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class InfoConversationScreen extends StatefulWidget {
  const InfoConversationScreen({
    super.key,
    required this.controleConversational,
    required this.controlePersonalHistory,
    required this.controlerMedicalAndGeneticHistoryOfTheFamily,
    required this.controleChildMedicalAndMedicalHistory,
    required this.controlechildDevelopmentalHistory,
    required this.controleNoteConversation,
  });
  final StepperPersonalHistoryConversational controlePersonalHistory;
  final StepperMedicalAndGeneticHistoryOfTheFamily
      controlerMedicalAndGeneticHistoryOfTheFamily;
  final StepperChildMedicalAndMedicalHistory
      controleChildMedicalAndMedicalHistory;
  final StepperChildDevelopmentalHistory controlechildDevelopmentalHistory;
  final StepperNoteConversation controleNoteConversation;
  final ControleConversational controleConversational;

  @override
  State<InfoConversationScreen> createState() => _InfoConversationScreenState();
}

class _InfoConversationScreenState extends State<InfoConversationScreen> {
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
            final result = await navigateTo(
              context,
              StepperConversational(
                controleConversational: widget.controleConversational,
                controleChildDevelopmentalHistory:
                    widget.controlechildDevelopmentalHistory,
                controleNoteConversation: widget.controleNoteConversation,
                controlerChildMedicalAndMedicalHistory:
                    widget.controleChildMedicalAndMedicalHistory,
                controlerMedicalAndGeneticHistoryOfTheFamily:
                    widget.controlerMedicalAndGeneticHistoryOfTheFamily,
                personalHistoryConversational: widget.controlePersonalHistory,
              ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Image.asset(AppImages.naturalTherapy)),
              const Text(
                " إستمارة دراسة حالة",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold),
              ),
              ButtonText(
                  text: 'البیانات الأولیة',
                  onPressed: () {
                    navigateTo(
                      context,
                      PersonalHistoryConversationalView(
                        controlePersonalHistory: widget.controleConversational,
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
                            controleConversational:
                                widget.controleConversational));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'التاریخ الصحي والمرضي للطفل',
                  onPressed: () {
                    navigateTo(
                        context,
                        ChildMedicalAndMedicalHistoryView(
                            controleChildMedicalAndMedicalHistory:
                                widget.controleChildMedicalAndMedicalHistory));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'تاریخ النمو التطوري للطفل',
                  onPressed: () {
                    navigateTo(
                        context,
                        ChildDevelopmentalHistoryView(
                            controlechildDevelopmentalHistory:
                                widget.controlechildDevelopmentalHistory));
                  },
                  borderRadius: 7),
              ButtonText(
                  text: 'ملاحظات',
                  onPressed: () {
                    navigateTo(
                      context,
                      NoteConversationalView(
                        controleNoteConversation:
                            widget.controleNoteConversation,
                      ),
                    );
                  },
                  borderRadius: 7),
            ],
          ),
        ),
      ),
    );
  }
}
