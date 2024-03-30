import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/pateint_info_cubit.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/styles.dart';
import '../controler.dart';

class NoteConversation extends StatelessWidget {
  const NoteConversation(
      {super.key,
      required this.controlConversational,
      required this.id,
      required this.noteConversation});
  final ControlConversational controlConversational;
  final String id;
  final List<ModelPatientInfo> noteConversation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, 'refresh');
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('ملاحظات'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: Column(
            children: [
              Column(
                children: List.generate(
                  controlConversational.listOfNoteConversation.length,
                  (index) => TextFormFiledStepper(
                    hintText: noteConversation[index].answer,
                    textDirection: TextDirection.rtl,
                    textEditingController: controlConversational
                        .listOfNoteConversation[index].control,
                    labelName: noteConversation[index].question!,
                  ),
                ),
              ),
              ButtonText(
                  text: "حفظ",
                  onPressed: () {
                    List<Map> listOfAnswer = [];
                    int i = 1;
                    for (final person
                        in controlConversational.listOfPersonal) {
                      listOfAnswer.add(
                        ModelPatientInfo(
                          questionId: i,
                          answer: person.control.text.isEmpty
                              ? 'لايوجد'
                              : person.control.text,
                        ).toJson(),
                      );
                      i++;
                    }
                    for (final person in controlConversational
                        .listOfMedicalAndGeneticHistoryOfTheFamily) {
                      listOfAnswer.add(
                        ModelPatientInfo(
                          questionId: i,
                          answer: person.control.text.isEmpty
                              ? 'لايوجد'
                              : person.control.text,
                        ).toJson(),
                      );
                      i++;
                    }
                    for (final person in controlConversational
                        .listOfChildMedicalAndMedicalHistory) {
                      listOfAnswer.add(
                        ModelPatientInfo(
                          questionId: i,
                          answer: person.control.text.isEmpty
                              ? 'لايوجد'
                              : person.control.text,
                        ).toJson(),
                      );
                      i++;
                    }
                    for (final person in controlConversational
                        .listOfChildDevelopmentalHistory) {
                      listOfAnswer.add(
                        ModelPatientInfo(
                          questionId: i,
                          answer: person.control.text.isEmpty
                              ? 'لايوجد'
                              : person.control.text,
                        ).toJson(),
                      );
                      i++;
                    }
                    for (final person
                        in controlConversational.listOfNoteConversation) {
                      listOfAnswer.add(
                        ModelPatientInfo(
                          questionId: i,
                          answer: person.control.text.isEmpty
                              ? 'لايوجد'
                              : person.control.text,
                        ).toJson(),
                      );
                      i++;
                    }
                    for (var element in listOfAnswer) {
                      debugPrint(element.toString());
                    }
                    debugPrint(listOfAnswer.toString());

                    BlocProvider.of<PatientInfoCubit>(context)
                        .postAnswerToApi(id, listOfAnswer);
                  }),
              BlocBuilder<PatientInfoCubit, PatientInfoState>(
                builder: (context, state) {
                  if (state is PatientLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  if (state is PatientSuccess) {
                    return const Center(
                        child: Icon(
                      Icons.check,
                      color: AppColors.primaryColor,
                    ));
                  }
                  if (state is PatientErrorMsg) {
                    return Text(
                      state.msg,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.lrTitles
                          .copyWith(color: Colors.red, fontSize: 15),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
