import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/sample.dart';
import 'package:manaber/shared/styles/styles.dart';
import '../../../model.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../controller.dart';
import '../model.dart';

class Rom extends StatefulWidget {
  const Rom(
      {super.key,
      required this.id,
      required this.rom,
      required this.controleFileAssesment});

  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> rom;
  final String id;

  @override
  State<Rom> createState() => _RomState();
}

class _RomState extends State<Rom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, 'refresh');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text('Rom'),
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
                itemCount: widget.controleFileAssesment.listRom.length,
                itemBuilder: (context, index) {
                  var model = widget.controleFileAssesment.listRom[index];
                  print(widget.controleFileAssesment.listRom.length);
                  print(widget.rom.length);
                  if (model is DropdownButtonItemModel) {
                    model.controller.text =
                        widget.rom[index].answer ?? model.itemList.first;
                    return CustomDropdownButton2(
                      hint: model.labelName,
                      value: model.controller.text,
                      dropdownItems: model.itemList,
                      onChanged: (value) {
                        setState(() {
                          widget.rom[index].answer = value ?? "null";
                        });
                      },
                    );
                    // DropdownButtonItem(
                    //   onChanged: (p0) {
                    //     rom[index].answer = p0 ?? "null";
                    //     print(rom[index].answer);
                    //   },
                    //   controller: model.controller,
                    //   labelName: model.labelName,
                    //   itemList: model.itemList,
                    // );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        onChanged: (p0) {
                          widget.rom[index].answer = p0 ?? "null";
                        },
                        initialValue: widget.rom[index].answer,
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
  int i = 121;
  for (final person in controleFileAssesment.listRom) {
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
          // question: person.labelName,
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
