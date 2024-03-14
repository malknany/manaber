import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/form_medical/cubit/pateint_info_cubit.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/widget/motor_system.dart';
import 'package:manaber/features/sample.dart';
import 'package:manaber/shared/styles/styles.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../model.dart';
import '../controller.dart';
import '../model.dart';

class LevelofSelectivity extends StatefulWidget {
  const LevelofSelectivity(
      {super.key,
      required this.id,
      required this.levelofSelectivity,
      required this.controleFileAssesment});
  final List<ModelPatientInfo> levelofSelectivity;
  final String id;
  final ControleFileAssesment controleFileAssesment;

  @override
  State<LevelofSelectivity> createState() => _LevelofSelectivityState();
}

class _LevelofSelectivityState extends State<LevelofSelectivity> {
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
        title: const Text('Level of Selectivity'),
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
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount:
                    widget.controleFileAssesment.listlevelOfSelctivity.length,
                itemBuilder: (context, index) {
                  var model =
                      widget.controleFileAssesment.listlevelOfSelctivity[index];
                  if (model is DividerFileAssModel) {
                    return DividerItem(text: model.text);
                  }
                  if (model is DropdownButtonItemModel) {
                    model.controller.text =
                        widget.levelofSelectivity[index].answer ??
                            model.itemList.first;
                    return CustomDropdownButton2(
                      hint: model.labelName,
                      value: model.controller.text,
                      dropdownItems: model.itemList,
                      onChanged: (value) {
                        setState(() {
                          widget.levelofSelectivity[index].answer =
                              value ?? "null";
                        });
                      },
                    );
                  }

                  if (model is TableDataFileAssModel) {
                    return DataTable(
                      showBottomBorder: true,
                      dataRowMinHeight: 35,
                      headingRowColor: const MaterialStatePropertyAll(
                          AppColors.primarycolor),
                      columns: [
                        DataColumn(
                            label: Text(
                          model.name,
                          style: const TextStyle(color: Colors.white),
                        )),
                        const DataColumn(
                            label: Text('Left',
                                style: TextStyle(color: Colors.white)),
                            numeric: true),
                        const DataColumn(
                            label: Text('Right',
                                style: TextStyle(color: Colors.white)),
                            numeric: true),
                      ],
                      rows: List<DataRow>.generate(
                        model.itemList.length,
                        (index) {
                          final item = model.itemList[index];
                          if (item is TextFormFiledRightLiftModel) {
                            String left = widget.levelofSelectivity[index].left
                                .toString();
                            String right = widget
                                .levelofSelectivity[index].right
                                .toString();
                            return DataRow(
                              cells: [
                                DataCell(Text(item.labelName)),
                                DataCell(TextFormFiledTableData(
                                  onChanged: (p0) {
                                    left = p0;
                                  },
                                  textEditingController: item.controllerLeft,
                                  initialValue: left,
                                )),
                                DataCell(TextFormFiledTableData(
                                  onChanged: (p0) {
                                    right = p0;
                                  },
                                  textEditingController: item.controllerRight,
                                  initialValue: right,
                                )),
                              ],
                            );
                          }
                          return const DataRow(cells: []);
                        },
                      ),
                    );
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
  int i = 94;
  for (final person in controleFileAssesment.listlevelOfSelctivity) {
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
    if (person is TableDataFileAssModel) {
      for (final item in person.itemList) {
        if (item is TextFormFiledRightLiftModel) {
          listOfAnswer.add(
            ModelPatientInfo(
              id: i,
              questionId: i,
              left: item.controllerLeft.text.isEmpty
                  ? 0
                  : int.parse(item.controllerLeft.text),
              right: item.controllerRight.text.isEmpty
                  ? 0
                  : int.parse(item.controllerRight.text),
            ).toJson(),
          );
          i++;
        }
      }
    }
  }
  return listOfAnswer;
}
/*DropdownButtonItem(
                controller: controlBodyFunction.upperLimb,
                lableName: 'Upper limb',
                itemList: const ['No', 'Poor', 'Moderate', 'Normal']),
            DropdownButtonItem(
                controller: controlBodyFunction.lowerLimb,
                lableName: 'Lower limb ',
                itemList: const ['No', 'Poor', 'Moderate', 'Normal']),
            // !
            ShowDialogItems(
              name: ' Muscle ',
              contecnt: SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const DividerItem(text: 'Muscle'),
                        RightLeftTextFiled(
                            title: 'Gluteal',
                            controllerRight:
                                controlBodyFunction.glutealMuscleRight,
                            controllerLeft:
                                controlBodyFunction.glutealMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Abductors',
                            controllerRight:
                                controlBodyFunction.abductorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.abductorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Addoctors',
                            controllerRight:
                                controlBodyFunction.adductorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.adductorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Hip flexors',
                            controllerRight:
                                controlBodyFunction.hipFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.hipFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Quadriceps',
                            controllerRight:
                                controlBodyFunction.quadricepsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.quadricepsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Hamstring',
                            controllerRight:
                                controlBodyFunction.hamstringMuscleRight,
                            controllerLeft:
                                controlBodyFunction.hamstringMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Planter flexors',
                            controllerRight:
                                controlBodyFunction.planterFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.planterFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Dorsiflexors',
                            controllerRight:
                                controlBodyFunction.dorsiflexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.dorsiflexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Shoulder flexors',
                            controllerRight:
                                controlBodyFunction.shoulderFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.shoulderFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Shoulder Extensors',
                            controllerRight: controlBodyFunction
                                .shoulderExtensorsMuscleRight,
                            controllerLeft: controlBodyFunction
                                .shoulderExtensorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Shoulder Abductors',
                            controllerRight: controlBodyFunction
                                .shoulderAbductorsMuscleRight,
                            controllerLeft: controlBodyFunction
                                .shoulderAbductorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Elbow Flexors',
                            controllerRight:
                                controlBodyFunction.elbowFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.elbowFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Elbow Extensors',
                            controllerRight:
                                controlBodyFunction.elbowExtensorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.elbowExtensorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Wrist Flexors',
                            controllerRight:
                                controlBodyFunction.wristFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.wristFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Wrist Extensors',
                            controllerRight:
                                controlBodyFunction.wristExtensorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.wristExtensorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Finger Flexors',
                            controllerRight:
                                controlBodyFunction.fingerFlexorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.fingerFlexorsMuscleLeft),
                        RightLeftTextFiled(
                            title: 'Finger Extensors',
                            controllerRight:
                                controlBodyFunction.fingerExtensorsMuscleRight,
                            controllerLeft:
                                controlBodyFunction.fingerExtensorsMuscleLeft),
                        ButtonText(
                            text: 'Save',
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
*/ 