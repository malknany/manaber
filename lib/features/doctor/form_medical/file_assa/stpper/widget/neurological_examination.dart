import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/sample.dart';
import 'package:manaber/shared/styles/styles.dart';
import '../../../model.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class NeurologicalExamination extends StatefulWidget {
  const NeurologicalExamination(
      {super.key,
      required this.id,
      required this.neurologicalExamination,
      required this.controleFileAssesment});
  final String id;
  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> neurologicalExamination;

  @override
  State<NeurologicalExamination> createState() =>
      _NeurologicalExaminationState();
}

class _NeurologicalExaminationState extends State<NeurologicalExamination> {
  final List<String> listTitleSprated = [
    'Primitive Reflexes',
    'Advanced reflex'
  ];

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
        title: const Text('Neurological Examination'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  if (index == 2) {
                    return DividerItem(text: listTitleSprated[0]);
                  }
                  if (index == 13) {
                    return DividerItem(text: listTitleSprated[1]);
                  }

                  return const SizedBox.shrink();
                },
                addAutomaticKeepAlives: true,
                itemCount: widget.controleFileAssesment.listNeurological.length,
                itemBuilder: (context, index) {
                  var model =
                      widget.controleFileAssesment.listNeurological[index];
                  // if (model is DividerFileAssModel) {
                  //   return DividerItem(text: model.text);
                  // }
                  if (model is DropdownButtonItemModel) {
                    model.controller.text =
                        widget.neurologicalExamination[index].answer ??
                            model.itemList.first;
                    return CustomDropdownButton2(
                      hint: model.labelName,
                      value: model.controller.text,
                      dropdownItems: model.itemList,
                      onChanged: (value) {
                        setState(() {
                          widget.neurologicalExamination[index].answer =
                              value ?? "null";
                        });
                      },
                    );
                    // DropdownButtonItem(
                    //   onChanged: (p0) {
                    //     neurologicalExamination[index].answer = p0 ?? "null";
                    //   },
                    //   controller: model.controller,
                    //   labelName: model.labelName,
                    //   itemList: model.itemList,
                    // );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        onChanged: (p0) {
                          widget.neurologicalExamination[index].answer =
                              p0 ?? "Null";
                        },
                        initialValue:
                            widget.neurologicalExamination[index].answer,
                        labelname: model.labelName,
                        textEditingController: model.textEditingController);
                  }

                  // if (model is BottomSheetFileAssModel) {
                  //   return
                  //       // ShowDialogItems(
                  //       //   name: model.name,
                  //       //   contecnt:
                  //       Column(
                  //     children: [
                  //       // DividerItem(text: model.name),
                  //       Column(
                  //         children: List.generate(model.itemList.length, (idx) {
                  //           final item = model.itemList[idx];
                  //           if (item is TextFormFiledStepperModel) {
                  //             return TextFormFiledStepper(
                  //                 onChanged: (p0) {
                  //                   neurologicalExamination[index].answer =
                  //                       p0 ?? "null";
                  //                 },
                  //                 initialValue:
                  //                     neurologicalExamination[index].answer,
                  //                 labelname: item.labelName,
                  //                 textEditingController:
                  //                     item.textEditingController);
                  //           }
                  //           if (item is DropdownButtonItemModel) {
                  //             item.controller.text =
                  //                 neurologicalExamination[index].answer ??
                  //                     item.itemList.first;
                  //             return DropdownButtonItem(
                  //               onChanged: (p0) {
                  //                 neurologicalExamination[index].answer =
                  //                     p0 ?? "null";
                  //               },
                  //               controller: item.controller,
                  //               labelName: item.labelName,
                  //               itemList: item.itemList,
                  //             );
                  //           }
                  //           return const SizedBox.shrink();
                  //         }),
                  //       ),
                  //     ],
                  //   );
                  // ListView.builder(
                  //   itemCount: model.itemList.length,
                  //   itemBuilder: (context, idx) {
                  //     final item = model.itemList[idx];
                  //     if (item is TextFormFiledStepperModel) {
                  //       return TextFormFiledStepper(
                  //           onChanged: (p0) {
                  //             neurologicalExamination[idx].answer =
                  //                 p0 ?? "null";
                  //           },
                  //           initialValue:
                  //               neurologicalExamination[idx].answer,
                  //           labelname: item.labelName,
                  //           textEditingController:
                  //               item.textEditingController);
                  //     }
                  //     if (item is DropdownButtonItemModel) {
                  //       item.controller.text =
                  //           neurologicalExamination[index].answer ??
                  //               item.itemList[index];
                  //       return DropdownButtonItem(
                  //         onChanged: (p0) {
                  //           neurologicalExamination[index].answer =
                  //               p0 ?? "null";
                  //         },
                  //         controller: item.controller,
                  //         labelName: item.labelName,
                  //         itemList: item.itemList,
                  //       );
                  //     }
                  //     return const SizedBox.shrink();
                  //   },
                  // );
                  // }
                  // );
                  // }

                  return const SizedBox.shrink();
                },
              ),
            ),
            //
            ButtonText(
              text: 'Save',
              onPressed: () {
                dynamic listOfAnswer =
                    _sendDataPateintInfo(widget.controleFileAssesment);
                BlocProvider.of<PateintInfoCubit>(context)
                    .postAnswerToApi(widget.id, listOfAnswer);
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
        ),
      ),
    );
  }
}

_sendDataPateintInfo(ControleFileAssesment controleFileAssesment) {
  List<Map> listOfAnswer = [];
  int i = 39;

  for (final person in controleFileAssesment.listNeurological) {
    if (person is DropdownButtonItemModel) {
      listOfAnswer.add(
        ModelPatientInfo(
          options: person.itemList,
          id: i,
          questionId: i,
          answer: person.controller.text.isEmpty
              ? person.itemList.first
              : person.controller.text,
        ).toJson(),
      );
      i++;
    }
    if (person is TextFormFiledStepperModel) {
      listOfAnswer.add(
        ModelPatientInfo(
          id: i,
          questionId: i,
          answer: person.textEditingController.text.isEmpty
              ? "null"
              : person.textEditingController.text,
        ).toJson(),
      );
      i++;
    }
  }

  return listOfAnswer;
}
