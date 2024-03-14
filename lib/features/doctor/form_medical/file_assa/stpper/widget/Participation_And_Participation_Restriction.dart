// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/model.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/features/sample.dart';
import 'package:manaber/shared/styles/styles.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../controller.dart';

class Activity extends StatefulWidget {
  const Activity(
      {super.key,
      required this.id,
      required this.activity,
      required this.controleFileAssesment});

  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> activity;
  final String id;

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
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
        title: const Text('Activity'),
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
                itemCount:
                    widget.controleFileAssesment.listParticipation.length,
                itemBuilder: (context, index) {
                  var model =
                      widget.controleFileAssesment.listParticipation[index];
                  if (model is DividerFileAssModel) {
                    return DividerItem(text: model.text);
                  }
                  if (model is DropdownButtonItemModel) {
                    model.controller.text =
                        widget.activity[index].answer ?? model.itemList.first;
                    return CustomDropdownButton2(
                      hint: model.labelName,
                      value: model.controller.text,
                      dropdownItems: model.itemList,
                      onChanged: (value) {
                        setState(() {
                          widget.activity[index].answer = value ?? "null";
                        });
                      },
                    );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        textInputAction: TextInputAction.newline,
                        textInputType: TextInputType.multiline,
                        onChanged: (p0) {
                          widget.activity[index].answer = p0 ?? "null";
                        },
                        initialValue: widget.activity[index].answer,
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
  int i = 127;

  for (final person in controleFileAssesment.listParticipation) {
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
  }

  return listOfAnswer;
}
