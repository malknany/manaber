import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/pateint_info_cubit.dart';
import '../../../model.dart';
import '../../../../../../shared/styles/styles.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class Note extends StatelessWidget {
  const Note(
      {super.key,
      required this.motor,
      required this.note,
      required this.personalHistory,
      required this.controleFileAssesment,
      required this.iCFBodyFunction,
      required this.id});
  final String id;
  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> note;
  final List<ModelPatientInfo> motor;
  final List<ModelPatientInfo> personalHistory;
  final List<ModelPatientInfo> iCFBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  var model = controleFileAssesment.listGoal.last;
                  if (model is TextFormFiledStepperModel) {
                    return Column(
                      children: [
                        TextFormFiledStepper(
                            textInputAction: TextInputAction.newline,
                            textInputType: TextInputType.multiline,
                            onChanged: (p0) {
                              note[0].answer = p0 ?? "null";
                            },
                            initialValue: note[0].answer,
                            labelname: model.labelName,
                            textEditingController: model.textEditingController),
                        ButtonText(
                          text: 'Save',
                          onPressed: () {
                            final listOfAnswer = _sendData();
                            BlocProvider.of<PateintInfoCubit>(context)
                                .postAnswerToApi(id, listOfAnswer);
                            // Navigator.pop(context, 'refresh');
                          },
                        ),
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
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendData() {
    List<Map> listOfAnswer = [];
    int i = 129;
    // for (final person in controleFileAssesment.listPatientInfo) {
    //   if (person is DropdownButtonItemModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         options: person.itemList,
    //         id: i,
    //         questionId: i,
    //         answer: person.controller.text.isEmpty
    //             ? person.itemList.first
    //             : person.controller.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is TextFormFiledStepperModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         questionId: i,
    //         answer: person.textEditingController.text.isEmpty
    //             ? "null"
    //             : person.textEditingController.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    // }

    // for (final person in controleFileAssesment.listicfBody) {
    //   if (person is DropdownButtonItemModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         // question: person.labelName,
    //         questionId: i,
    //         answer: person.controller.text.isEmpty
    //             ? person.itemList.first
    //             : person.controller.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is TextFormFiledStepperModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         questionId: i,
    //         answer: person.textEditingController.text.isEmpty
    //             ? ' '
    //             : person.textEditingController.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is TableDataFileAssModel) {
    //     for (final item in person.itemList) {
    //       if (item is TextFormFiledRightLiftModel) {
    //         listOfAnswer.add(
    //           ModelPatientInfo(
    //                   id: i,
    //                   questionId: i,
    //                   left: item.controllerLeft.text.isEmpty
    //                       ? 0
    //                       : int.parse(item.controllerLeft.text),
    //                   right: item.controllerRight.text.isEmpty
    //                       ? 0
    //                       : int.parse(item.controllerRight.text)
    //                   //answer: item.textEditingController.text.isEmpty
    //                   //  ? 'null'
    //                   // : item.textEditingController.text,
    //                   )
    //               .toJson(),
    //         );
    //         i++;
    //       }
    //     }
    //   }
    // }
    // for (final person in controleFileAssesment.listNeurological) {
    //   if (person is TextFormFiledStepperModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         questionId: i,
    //         answer: person.textEditingController.text.isEmpty
    //             ? 'null'
    //             : person.textEditingController.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is DropdownButtonItemModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         // question: person.labelName,
    //         questionId: i,
    //         answer: person.controller.text.isEmpty
    //             ? person.itemList.first
    //             : person.controller.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }

    // }
    // for (final person in controleFileAssesment.listMotor) {
    //   if (person is DropdownButtonItemModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         // question: person.labelName,
    //         questionId: i,
    //         answer: person.controller.text.isEmpty
    //             ? person.itemList.first
    //             : person.controller.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is TextFormFiledStepperModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         questionId: i,
    //         answer: person.textEditingController.text.isEmpty
    //             ? 'null'
    //             : person.textEditingController.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is TableDataFileAssModel) {
    //     for (final item in person.itemList) {
    //       if (item is TextFormFiledRightLiftModel) {
    //         listOfAnswer.add(
    //           ModelPatientInfo(
    //             id: i,
    //             // question: item.labelName,
    //             questionId: i,
    //             left: item.controllerLeft.text.isNotEmpty
    //                 ? int.parse(item.controllerLeft.text)
    //                 : 0,
    //             right: item.controllerRight.text.isNotEmpty
    //                 ? int.parse(item.controllerRight.text)
    //                 : 0,
    //           ).toJson(),
    //         );
    //         i++;
    //       }
    //     }
    //   }
    // }
    // for (final person in controleFileAssesment.listlevelOfSelctivity) {
    //   if (person is DropdownButtonItemModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         // question: person.labelName,
    //         questionId: i,
    //         answer: person.controller.text.isEmpty
    //             ? person.itemList.first
    //             : person.controller.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is TableDataFileAssModel) {
    //     for (final item in person.itemList) {
    //       if (item is TextFormFiledRightLiftModel) {
    //         listOfAnswer.add(
    //           ModelPatientInfo(
    //             id: i,
    //             // question: item.labelName,
    //             questionId: i,
    //             left: item.controllerLeft.text.isEmpty
    //                 ? 0
    //                 : int.parse(item.controllerLeft.text),
    //             right: item.controllerRight.text.isEmpty
    //                 ? 0
    //                 : int.parse(item.controllerRight.text),
    //           ).toJson(),
    //         );
    //         i++;
    //       }
    //     }
    //   }
    // }
    // for (final person in controleFileAssesment.listMuscloskelton) {
    //   if (person is TextFormFiledStepperModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         questionId: i,
    //         answer: person.textEditingController.text.isEmpty
    //             ? 'null'
    //             : person.textEditingController.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is DropdownButtonItemModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         // question: person.labelName,
    //         questionId: i,
    //         answer: person.controller.text.isEmpty
    //             ? person.itemList.first
    //             : person.controller.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    // }
    // for (final person in controleFileAssesment.listRom) {
    //   if (person is TextFormFiledStepperModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         questionId: i,
    //         answer: person.textEditingController.text.isEmpty
    //             ? 'null'
    //             : person.textEditingController.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    //   if (person is DropdownButtonItemModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         // question: person.labelName,
    //         questionId: i,
    //         answer: person.controller.text.isEmpty
    //             ? person.itemList.first
    //             : person.controller.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    // }
    // for (final person in controleFileAssesment.listParticipation) {
    //   if (person is TextFormFiledStepperModel) {
    //     listOfAnswer.add(
    //       ModelPatientInfo(
    //         id: i,
    //         questionId: i,
    //         answer: person.textEditingController.text.isEmpty
    //             ? 'null'
    //             : person.textEditingController.text,
    //       ).toJson(),
    //     );
    //     i++;
    //   }
    // }
    for (final person in controleFileAssesment.listGoal) {
      if (person is TextFormFiledStepperModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            id: i,
            questionId: i,
            answer: person.textEditingController.text.isEmpty
                ? 'null'
                : person.textEditingController.text,
          ).toJson(),
        );
        i++;
      }
      if (person is DropdownButtonItemModel) {
        listOfAnswer.add(
          ModelPatientInfo(
            id: i,
            questionId: i,
            answer: person.controller.text.isEmpty
                ? person.itemList.first
                : person.controller.text,
          ).toJson(),
        );
        i++;
      }
    }

    return listOfAnswer;
  }
}
