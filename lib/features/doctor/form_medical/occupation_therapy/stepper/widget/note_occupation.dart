import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/pateint_info_cubit.dart';
import '../../../model.dart';
import '../model.dart';
import '../../../../../../shared/styles/styles.dart';

import '../controler.dart';
import '../../../../../../shared/components/components.dart';

import '../../../../../../shared/styles/colors.dart';

class NoteOccupation extends StatelessWidget {
  const NoteOccupation({
    super.key,
    required this.controlOccupation,
    required this.id,
    required this.noteOccupation,
  });
  final String id;
  final ControlOccupation controlOccupation;
  final List<ModelPatientInfo> noteOccupation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, 'refresh');
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Note'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormFiledStepper(
                    hintText: noteOccupation.last.answer ?? '',
                    labelName: 'Note',
                    textEditingController:
                        controlOccupation.controlOccupationPerformance.note),
                ButtonText(
                    text: "Save",
                    onPressed: () {
                      List<Map> listOfAnswer = [];
                      int i = 1;
                      for (final person
                          in controlOccupation.listOfPationHistory) {
                        if (person is ModelDropDownOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? null
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                        if (person is ModelTextFiledOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? 'null'
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                      }
                      for (final person
                          in controlOccupation.listOfBodyFunctionStrucer) {
                        if (person is ModelDropDownOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? null
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                        if (person is ModelTextFiledOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? 'null'
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                      }
                      for (final person
                          in controlOccupation.listOfBehaviorADLS) {
                        if (person is ModelDropDownOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? null
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                        if (person is ModelTextFiledOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? 'null'
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                      }
                      for (final person
                          in controlOccupation.listOfAssociatedDisorders) {
                        if (person is ModelDropDownOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? null
                                  : person.textEditingController.text
                                      .toString(),
                            ).toJson(),
                          );
                          i++;
                        }
                        if (person is ModelTextFiledOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? 'null'
                                  : person.textEditingController.text
                                      .toString(),
                            ).toJson(),
                          );
                          i++;
                        }
                      }
                      for (final person
                          in controlOccupation.listOfOccupationPerformance) {
                        if (person is ModelDropDownOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? null
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                        if (person is ModelTextFiledOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? 'null'
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                      }
                      for (var element in listOfAnswer) {
                        print(element);
                      }
                      print(listOfAnswer);
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
          )),
    );
  }
}
