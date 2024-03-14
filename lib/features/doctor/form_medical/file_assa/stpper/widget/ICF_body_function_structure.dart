// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

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

class ICFBodyfunctionAndstructure extends StatefulWidget {
  const ICFBodyfunctionAndstructure(
      {super.key,
      required this.id,
      required this.iCFBodyfunction,
      required this.controleFileAssesment});

  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> iCFBodyfunction;
  final String id;

  @override
  State<ICFBodyfunctionAndstructure> createState() =>
      _ICFBodyfunctionAndstructureState();
}

class _ICFBodyfunctionAndstructureState
    extends State<ICFBodyfunctionAndstructure> {
  final List<String> listTitleSprated = [
    'Sensory Examination',
    'GaiT Problems',
    'Developmental Milestones'
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
        title: const Text('ICF Body function And Structure'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  if (index == 3) {
                    return DividerItem(text: listTitleSprated[0]);
                  }
                  if (index == 8) {
                    return DividerItem(text: listTitleSprated[1]);
                  }
                  if (index == 11) {
                    return DividerItem(text: listTitleSprated[2]);
                  }

                  return const SizedBox.shrink();
                },
                addAutomaticKeepAlives: true,
                itemCount: widget.controleFileAssesment.listicfBody.length,
                itemBuilder: (context, index) {
                  var model = widget.controleFileAssesment.listicfBody[index];

                  if (model is DropdownButtonItemModel) {
                    model.controller.text =
                        widget.iCFBodyfunction[index].answer ??
                            model.itemList.first;
                    return CustomDropdownButton2(
                      hint: model.labelName,
                      value: model.controller.text,
                      dropdownItems: model.itemList,
                      onChanged: (value) {
                        setState(() {
                          widget.iCFBodyfunction[index].answer =
                              value ?? "null";
                        });
                      },
                    );
                    // DropdownButtonItem(
                    //   onChanged: (p0) {
                    //     iCFBodyfunction[index].answer = p0 ?? "null";
                    //   },
                    //   controller: model.controller,
                    //   labelName: model.labelName,
                    //   itemList: model.itemList,
                    // );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        initialValue: widget.iCFBodyfunction[index].answer,
                        onChanged: (p0) {
                          widget.iCFBodyfunction[index].answer = p0 ?? "-";
                        },
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
  int i = 19;
  for (final person in controleFileAssesment.listicfBody) {
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
    if (person is TextFormFiledStepperModel) {
      listOfAnswer.add(
        ModelPatientInfo(
          id: i,
          questionId: i,
          answer: person.textEditingController.text.isEmpty
              ? ' '
              : person.textEditingController.text,
        ).toJson(),
      );
      i++;
    }
    // if (person is TableDataFileAssModel) {
    //   for (final item in person.itemList) {
    //     if (item is TextFormFiledRightLiftModel) {
    //       listOfAnswer.add(
    //         ModelPatientInfo(
    //                 id: i,
    //                 questionId: i,
    //                 left: item.controllerLeft.text.isEmpty
    //                     ? 0
    //                     : int.parse(item.controllerLeft.text),
    //                 right: item.controllerRight.text.isEmpty
    //                     ? 0
    //                     : int.parse(item.controllerRight.text)
    //                 //answer: item.textEditingController.text.isEmpty
    //                 //  ? 'null'
    //                 // : item.textEditingController.text,
    //                 )
    //             .toJson(),
    //       );
    //       i++;
    //     }
    //   }
    // }
  }
  return listOfAnswer;
}
// DropdownButtonItem(
            //     controller: controlBodyFunction.mentalStatus,
            //     lableName: 'Mental status',
            //     itemList: const [
            //       'Normal',
            //       'Less than nomal',
            //       'Mental retarted'
            //     ]),
            // TextFormFiledStepper(
            //     labelname: 'Voice Speech',
            //     textEditingController: controlBodyFunction.voiceSpeech),
            // DropdownButtonItem(
            //     controller:
            //         controlBodyFunction.functionOfMetabolicAndEndocrine,
            //     lableName: 'Function of metabolic and endocrine',
            //     itemList: const [
            //       'Normal',
            //       'Less than nomal',
            //       'Malnutrition',
            //       'Obese'
            //     ]),
            // TextFormFiledStepper(
            //     labelname: 'Function of Cardiovascular ',
            //     textEditingController:
            //         controlBodyFunction.functionOfCardiovascularRespiration),
            // const DividerItem(text: 'Sensory Examination'),
            // TextFormFiledStepper(
            //     labelname: 'Superficial',
            //     textEditingController: controlBodyFunction.superficial),
            // TextFormFiledStepper(
            //     labelname: 'Vestibular',
            //     textEditingController: controlBodyFunction.vestibular),
            // TextFormFiledStepper(
            //     labelname: 'Proprioception',
            //     textEditingController: controlBodyFunction.proprioception),
            // TextFormFiledStepper(
            //     labelname: 'Tactile',
            //     textEditingController: controlBodyFunction.tactile),
            // const DividerItem(text: 'GaiT Problems '),
            // TextFormFiledStepper(
            //     labelname: 'Note',
            //     textEditingController: controlBodyFunction.gaitnote),
            // TextFormFiledStepper(
            //     labelname: 'Stance phase',
            //     textEditingController: controlBodyFunction.stancePhase),
            // TextFormFiledStepper(
            //     labelname: 'Swing phase',
            //     textEditingController: controlBodyFunction.swingPhase),
            // const Divider(
            //   color: AppColors.grey,
            //   thickness: 2,
            // ),
            // TextFormFiledStepper(
            //     labelname: 'Balance',
            //     textEditingController: controlBodyFunction.balance),
            // ShowDialogItems(
            //   name: 'Developmental Milestones',
            //   contecnt: SizedBox(
            //     height: MediaQuery.sizeOf(context).height / 1.2,
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: 20, vertical: 10),
            //       child: ListView(
            //         children: [
            //           TextFormFiledStepper(
            //               labelname: 'Head control',
            //               textEditingController:
            //                   controlBodyFunction.headControl),
            //           TextFormFiledStepper(
            //               labelname: 'Rolling',
            //               textEditingController: controlBodyFunction.rolling),
            //           TextFormFiledStepper(
            //               labelname: 'Creeping',
            //               textEditingController:
            //                   controlBodyFunction.creeping),
            //           TextFormFiledStepper(
            //               labelname: 'Crawling',
            //               textEditingController:
            //                   controlBodyFunction.crawling),
            //           TextFormFiledStepper(
            //               labelname: 'Sitting',
            //               textEditingController: controlBodyFunction.sitting),
            //           TextFormFiledStepper(
            //               labelname: 'Standing',
            //               textEditingController:
            //                   controlBodyFunction.standing),
            //           TextFormFiledStepper(
            //               labelname: 'Walking',
            //               textEditingController: controlBodyFunction.walking),
            //           ButtonText(
            //               text: 'Save',
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               }),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // TextFormFiledStepper(
            //     labelname: 'Fine Motor Function (Hand Function) ',
            //     textEditingController:
            //         controlBodyFunction.fineMotorFunctionHandFunction),
