// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/controller.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/model.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/features/sample.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class MuscloskeletalExamination extends StatefulWidget {
  const MuscloskeletalExamination(
      {super.key,
      required this.id,
      required this.muscloskeletalExamination,
      required this.controleFileAssesment});

  final List<ModelPatientInfo> muscloskeletalExamination;
  final ControleFileAssesment controleFileAssesment;
  final String id;

  @override
  State<MuscloskeletalExamination> createState() =>
      _MuscloskeletalExaminationState();
}

class _MuscloskeletalExaminationState extends State<MuscloskeletalExamination> {
  final List<String> listTitleSprated = ['Posture And Alignment', 'Hip'];

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
        title: const Text('Muscloskeletal Examination'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  if (index == 0) {
                    return DividerItem(text: listTitleSprated[0]);
                  }
                  if (index == 5) {
                    return DividerItem(text: listTitleSprated[1]);
                  }

                  return const SizedBox.shrink();
                },
                addAutomaticKeepAlives: true,
                itemCount:
                    widget.controleFileAssesment.listMuscloskelton.length,
                itemBuilder: (context, index) {
                  var model =
                      widget.controleFileAssesment.listMuscloskelton[index];
                  print(widget.controleFileAssesment.listMuscloskelton.length);
                  print(widget.muscloskeletalExamination.length);
                  // if (model is DividerFileAssModel) {
                  //   return DividerItem(text: model.text);
                  // }
                  //! some error in dropdown
                  if (model is DropdownButtonItemModel) {
                    model.controller.text =
                        widget.muscloskeletalExamination[index].answer ??
                            model.itemList.first;
                    return CustomDropdownButton2(
                      hint: model.labelName,
                      value: model.controller.text,
                      dropdownItems: model.itemList,
                      onChanged: (value) {
                        setState(() {
                          widget.muscloskeletalExamination[index].answer =
                              value ?? "null";
                        });
                      },
                    );
                    // DropdownButtonItem(
                    //   onChanged: (p0) {
                    //     muscloskeletalExamination[index].answer = p0 ?? "null";
                    //   },
                    //   controller: model.controller,
                    //   labelName: model.labelName,
                    //   itemList: model.itemList,
                    // );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        onChanged: (p0) {
                          widget.muscloskeletalExamination[index].answer =
                              p0 ?? "Null";
                        },
                        initialValue:
                            widget.muscloskeletalExamination[index].answer,
                        labelname: model.labelName,
                        textEditingController: model.textEditingController);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
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
  int i = 113;
  for (final person in controleFileAssesment.listMuscloskelton) {
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
