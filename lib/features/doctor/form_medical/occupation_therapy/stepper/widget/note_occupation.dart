import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/model.dart';
import 'package:manaber/shared/styles/styles.dart';

import '../controler.dart';
import '../../../../../../shared/components/components.dart';

import '../../../../../../shared/styles/colors.dart';

class NoteOccupation extends StatelessWidget {
  const NoteOccupation({
    super.key,
    required this.controleOccupation,
    required this.id,
    required this.noteOccupation,
  });
  final String id;
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> noteOccupation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
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
                    labelname: 'Note ',
                    textEditingController:
                        controleOccupation.controleOccupationPreformance.note),
                ButtonText(
                    text: "Save",
                    onPressed: () {
                      List<Map> listOfAnswer = [];
                      int i = 1;
                      for (final person
                          in controleOccupation.listOfPationHistory) {
                        if (person is ModelDropDownOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? 'لايوجد'
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
                                  ? 'لايوجد'
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                      }
                      for (final person
                          in controleOccupation.listOfAssociatedDisorders) {
                        if (person is ModelDropDownOccupation) {
                          listOfAnswer.add(
                            ModelPatientInfo(
                              questionId: i,
                              answer: person.textEditingController.text.isEmpty
                                  ? 'لايوجد'
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
                                  ? 'لايوجد'
                                  : person.textEditingController.text,
                            ).toJson(),
                          );
                          i++;
                        }
                      }
                      // for (final person
                      //     in controleOccupation.listOfBodyFunctionStrucer) {
                      //   if (person is ModelDropDownOccupation) {
                      //     listOfAnswer.add(
                      //       ModelPatientInfo(
                      //         questionId: i,
                      //         answer: person.textEditingController.text.isEmpty
                      //             ? 'لايوجد'
                      //             : person.textEditingController.text,
                      //       ).toJson(),
                      //     );
                      //     i++;
                      //   }
                      //   if (person is ModelTextFiledOccupation) {
                      //     listOfAnswer.add(
                      //       ModelPatientInfo(
                      //         questionId: i,
                      //         answer: person.textEditingController.text.isEmpty
                      //             ? 'لايوجد'
                      //             : person.textEditingController.text,
                      //       ).toJson(),
                      //     );
                      //     i++;
                      //   }
                      // }
                      // for (final person
                      //     in controleOccupation.listOfBehaviorADLS) {
                      //   if (person is ModelDropDownOccupation) {
                      //     listOfAnswer.add(
                      //       ModelPatientInfo(
                      //         questionId: i,
                      //         answer: person.textEditingController.text.isEmpty
                      //             ? 'لايوجد'
                      //             : person.textEditingController.text,
                      //       ).toJson(),
                      //     );
                      //     i++;
                      //   }
                      //   if (person is ModelTextFiledOccupation) {
                      //     listOfAnswer.add(
                      //       ModelPatientInfo(
                      //         questionId: i,
                      //         answer: person.textEditingController.text.isEmpty
                      //             ? 'لايوجد'
                      //             : person.textEditingController.text,
                      //       ).toJson(),
                      //     );
                      //     i++;
                      //   }
                      // }
                      // for (final person
                      //     in controleOccupation.listOfOccupationPreformance) {
                      //   if (person is ModelDropDownOccupation) {
                      //     listOfAnswer.add(
                      //       ModelPatientInfo(
                      //         questionId: i,
                      //         answer: person.textEditingController.text.isEmpty
                      //             ? 'لايوجد'
                      //             : person.textEditingController.text,
                      //       ).toJson(),
                      //     );
                      //     i++;
                      //   }
                      //   if (person is ModelTextFiledOccupation) {
                      //     listOfAnswer.add(
                      //       ModelPatientInfo(
                      //         questionId: i,
                      //         answer: person.textEditingController.text.isEmpty
                      //             ? 'لايوجد'
                      //             : person.textEditingController.text,
                      //       ).toJson(),
                      //     );
                      //     i++;
                      //   }
                      // }
                      listOfAnswer.forEach((element) {
                        print(element);
                      });

                      BlocProvider.of<PateintInfoCubit>(context)
                          .postAnswerToApi(id, listOfAnswer);
                      // Future.delayed(const Duration(seconds: 3), () {
                      //   Navigator.pop(context, 'refresh');
                      // });
                    }),
                BlocBuilder<PateintInfoCubit, PateintInfoState>(
                  builder: (context, state) {
                    if (state is PateintLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primarycolor,
                        ),
                      );
                    }
                    if (state is PateintSuccess) {
                      return const Center(
                          child: Icon(
                        Icons.check,
                        color: AppColors.primarycolor,
                      ));
                    }
                    if (state is PateintErrorMsg) {
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
