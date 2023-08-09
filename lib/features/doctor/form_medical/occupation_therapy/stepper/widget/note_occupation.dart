import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/pateint_info_cubit.dart';
import '../../../model.dart';
import '../model.dart';
import '../../../../../../shared/styles/styles.dart';

import '../controler.dart';
import '../../../../../../shared/components/components.dart';

import '../../../../../../shared/styles/colors.dart';

class NoteOccupation extends StatefulWidget {
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
  State<NoteOccupation> createState() => _NoteOccupationState();
}

class _NoteOccupationState extends State<NoteOccupation>
    with AutomaticKeepAliveClientMixin<NoteOccupation> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, 'refresh');
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
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
                    hintText: widget.noteOccupation.last.answer ?? '',
                    labelname: 'Note',
                    textEditingController: widget
                        .controleOccupation.controleOccupationPreformance.note),
                ButtonText(
                    text: "Save",
                    onPressed: () {
                      List<Map> listOfAnswer = [];
                      int i = 1;
                      for (final person
                          in widget.controleOccupation.listOfPationHistory) {
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
                      for (final person in widget
                          .controleOccupation.listOfBodyFunctionStrucer) {
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
                          in widget.controleOccupation.listOfBehaviorADLS) {
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
                      for (final person in widget
                          .controleOccupation.listOfAssociatedDisorders) {
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
                      for (final person in widget
                          .controleOccupation.listOfOccupationPreformance) {
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
                      BlocProvider.of<PateintInfoCubit>(context)
                          .postAnswerToApi(widget.id, listOfAnswer);
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

  @override
  bool get wantKeepAlive => true;
}
