import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import '../controler.dart';

class NoteConversation extends StatelessWidget {
  const NoteConversation(
      {super.key, required this.controleConversational, required this.id});
  final ControleConversational controleConversational;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملاحظات'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: Column(
          children: [
            Column(
              children: List.generate(
                controleConversational.listOfNoteConversation.length,
                (index) => TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  textEditingController: controleConversational
                      .listOfNoteConversation[index].controle,
                  labelname: controleConversational
                      .listOfNoteConversation[index].lable,
                ),
              ),
            ),
            ButtonText(
                text: "حفظ",
                onPressed: () {
                  List<Map> listOfAnswer = [];
                  int i = 1;
                  for (final person in controleConversational.listOfPersonal) {
                    listOfAnswer.add(
                      ModelPatientInfo(
                        questionId: i,
                        answer: person.controle.text.isEmpty
                            ? 'لايوجد'
                            : person.controle.text,
                      ).toJson(),
                    );
                    i++;
                  }
                  for (final person in controleConversational
                      .listOfMedicalAndGeneticHistoryOfTheFamily) {
                    listOfAnswer.add(
                      ModelPatientInfo(
                        questionId: i,
                        answer: person.controle.text.isEmpty
                            ? 'لايوجد'
                            : person.controle.text,
                      ).toJson(),
                    );
                    i++;
                  }
                  for (final person in controleConversational
                      .listOfChildMedicalAndMedicalHistory) {
                    listOfAnswer.add(
                      ModelPatientInfo(
                        questionId: i,
                        answer: person.controle.text.isEmpty
                            ? 'لايوجد'
                            : person.controle.text,
                      ).toJson(),
                    );
                    i++;
                  }
                  for (final person in controleConversational
                      .listOfChildDevelopmentalHistory) {
                    listOfAnswer.add(
                      ModelPatientInfo(
                        questionId: i,
                        answer: person.controle.text.isEmpty
                            ? 'لايوجد'
                            : person.controle.text,
                      ).toJson(),
                    );
                    i++;
                  }
                  for (final person
                      in controleConversational.listOfNoteConversation) {
                    listOfAnswer.add(
                      ModelPatientInfo(
                        questionId: i,
                        answer: person.controle.text.isEmpty
                            ? 'لايوجد'
                            : person.controle.text,
                      ).toJson(),
                    );
                    i++;
                  }
                  listOfAnswer.forEach((element) {
                    print(element);
                  });

                  BlocProvider.of<PateintInfoCubit>(context)
                      .postAnswerToApi(id, listOfAnswer);
                  // Future.delayed(
                  //   const Duration(seconds: 2),
                  //   () {
                  //     Navigator.pop(context, 'refresh');
                  //   },
                  // );
                }),
          ],
        ),
      ),
    );
  }
}
