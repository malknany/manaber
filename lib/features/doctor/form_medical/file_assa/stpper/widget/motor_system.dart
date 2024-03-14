// import 'package:flutter/material.dart';
// import 'package:manaber/features/sample.dart';
// import '../../../model.dart';

// import '../../../../../../shared/components/components.dart';
// import '../../../../../../shared/styles/colors.dart';
// import '../controller.dart';
// import '../model.dart';

// class MotorSystem extends StatefulWidget {
//   const MotorSystem(
//       {super.key, required this.controleFileAssesment, required this.motor});
//   final ControleFileAssesment controleFileAssesment;
//   final List<ModelPatientInfo> motor;

//   @override
//   State<MotorSystem> createState() => _MotorSystemState();
// }

// class _MotorSystemState extends State<MotorSystem> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Motor System'),
//         backgroundColor: Colors.white,
//         foregroundColor: AppColors.primarycolor,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 addAutomaticKeepAlives: true,
//                 itemCount: widget.controleFileAssesment.listMotor.length,
//                 itemBuilder: (context, index) {
//                   var model = widget.controleFileAssesment.listMotor[index];
//                   // int counter = 0;
//                   // for (var element in widget.motor) {
//                   //   print("$counter ${element.toJson()}");
//                   //   counter++;
//                   // }

//                   if (model is DropdownButtonItemModel) {
//                     model.controller.text =
//                         widget.motor[index].answer ?? model.itemList.first;
//                     print("Before==${model.controller.text}");
//                     return CustomDropdownButton2(
//                       hint: model.labelName,
//                       value: model.controller.text,
//                       dropdownItems: model.itemList,
//                       onChanged: (value) {
//                         setState(() {
//                           widget.motor[index].answer = value ?? "null";
//                         });
//                       },
//                     );
//                     // DropdownButtonItem(
//                     //   onChanged: (p0) {
//                     //     motor[index].answer = p0 ?? "null";
//                     //   },
//                     //   controller: model.controller,
//                     //   labelName: model.labelName,
//                     //   itemList: model.itemList,
//                     // );
//                   }

//                   if (model is TextFormFiledStepperModel) {
//                     return TextFormFiledStepper(
//                         onChanged: (p0) {
//                           widget.motor[index].answer = p0 ?? "null";
//                         },
//                         initialValue: widget.motor[index].answer,
//                         labelname: model.labelName,
//                         textEditingController: model.textEditingController);
//                   }

//                   if (model is TableDataFileAssModel) {
//                     return DataTable(
//                       showBottomBorder: true,
//                       dataRowMinHeight: 35,
//                       headingRowColor: const MaterialStatePropertyAll(
//                           AppColors.primarycolor),
//                       columns: [
//                         DataColumn(
//                             label: Text(
//                           model.name,
//                           style: const TextStyle(color: Colors.white),
//                         )),
//                         const DataColumn(
//                             label: Text('Left',
//                                 style: TextStyle(color: Colors.white)),
//                             numeric: true),
//                         const DataColumn(
//                             label: Text('Right',
//                                 style: TextStyle(color: Colors.white)),
//                             numeric: true),
//                       ],
//                       rows: List<DataRow>.generate(
//                         model.itemList.length,
//                         (index) {
//                           final item = model.itemList[index];

//                           if (item is TextFormFiledRightLiftModel) {
//                             String left = widget.motor[index].left.toString();
//                             String right = widget.motor[index].right.toString();
//                             item.controllerLeft.text = left.isEmpty? "0":left;
//                             item.controllerRight.text = right.isEmpty? "0":right;
//                             return DataRow(
//                               cells: [
//                                 DataCell(Text(item.labelName)),

//                                 DataCell(CustomDropdownButton3(
//                                   value: item.controllerLeft.text,
//                                   dropdownItems: const ['0', '1', '2', '3'],
//                                   onChanged: (value) {
//                                     setState(() {
//                                       item.controllerLeft.text = value!;
//                                     });
//                                   },
//                                 )),
//                                 DataCell(CustomDropdownButton3(
//                                   value: item.controllerRight.text,
//                                   dropdownItems: const ['0', '1', '2', '3'],
//                                   onChanged: (value) {
//                                     setState(() {
//                                       item.controllerRight.text = value!;
//                                       // item.controllerRight.text = value!;
//                                     });
//                                   },
//                                 )),

//                               ],
//                             );
//                           }
//                           return const DataRow(cells: []);
//                         },
//                       ),
//                     );
//                   }

//                   return const SizedBox.shrink();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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

class MotorSystem extends StatefulWidget {
  const MotorSystem({
    super.key,
    required this.id,
    required this.controleFileAssesment,
    required this.motor,
  });
  final String id;
  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> motor;

  @override
  State<MotorSystem> createState() => _MotorSystemState();
}

class _MotorSystemState extends State<MotorSystem> {
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
        title: const Text('Motor System'),
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
                itemCount: widget.controleFileAssesment.listMotor.length,
                itemBuilder: (context, index) {
                  var model = widget.controleFileAssesment.listMotor[index];

                  if (model is DropdownButtonItemModel) {
                    model.controller.text =
                        widget.motor[index].answer ?? model.itemList.first;

                    return CustomDropdownButton2(
                      hint: model.labelName,
                      value: model.controller.text,
                      dropdownItems: model.itemList,
                      onChanged: (value) {
                        setState(() {
                          widget.motor[index].answer = value ?? "null";
                        });
                      },
                    );
                  }

                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                      onChanged: (p0) {
                        widget.motor[index].answer = p0 ?? "null";
                      },
                      initialValue: widget.motor[index].answer,
                      labelname: model.labelName,
                      textEditingController: model.textEditingController,
                    );
                  }

                  if (model is TableDataFileAssModel) {
                    return DataTable(
                      showBottomBorder: true,
                      dataRowMinHeight: 35,
                      headingRowColor: MaterialStateProperty.all(
                        AppColors.primarycolor,
                      ),
                      columns: [
                        DataColumn(
                          label: Text(
                            model.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            'Left',
                            style: TextStyle(color: Colors.white),
                          ),
                          numeric: true,
                        ),
                        const DataColumn(
                          label: Text(
                            'Right',
                            style: TextStyle(color: Colors.white),
                          ),
                          numeric: true,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        model.itemList.length,
                        (index) {
                          final item = model.itemList[index];

                          if (item is TextFormFiledRightLiftModel) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(item.labelName),
                                ),
                                DataCell(TextFormFiledTableData(
                                  onChanged: (p0) {
                                    item.controllerLeft.text = p0;
                                  },
                                  textEditingController: item.controllerLeft,
                                )),
                                DataCell(TextFormFiledTableData(
                                  onChanged: (p0) {
                                    item.controllerRight.text = p0;
                                  },
                                  textEditingController: item.controllerRight,
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
  int i = 55;

  for (final person in controleFileAssesment.listMotor) {
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
    if (person is TableDataFileAssModel) {
      for (final item in person.itemList) {
        if (item is TextFormFiledRightLiftModel) {
          listOfAnswer.add(
            ModelPatientInfo(
              id: i,
              questionId: i,
              left: item.controllerLeft.text.isNotEmpty
                  ? int.parse(item.controllerLeft.text)
                  : 0,
              right: item.controllerRight.text.isNotEmpty
                  ? int.parse(item.controllerRight.text)
                  : 0,
            ).toJson(),
          );
          i++;
        }
      }
    }
  }
  return listOfAnswer;
}
// DataTable(
//   showBottomBorder: true,
//   dataRowMinHeight: 35,
//   headingRowColor: MaterialStateProperty.all(
//     AppColors.primarycolor,
//   ),
//   columns: [
//     DataColumn(
//       label: Text(
//         model.name,
//         style: const TextStyle(color: Colors.white),
//       ),
//     ),
//     const DataColumn(
//       label: Text(
//         'Left',
//         style: TextStyle(color: Colors.white),
//       ),
//       numeric: true,
//     ),
//     const DataColumn(
//       label: Text(
//         'Right',
//         style: TextStyle(color: Colors.white),
//       ),
//       numeric: true,
//     ),
//   ],
//   rows: List<DataRow>.generate(
//     model.itemList.length,
//     (index) {
//       final item = model.itemList[index];

//       if (item is TextFormFiledRightLiftModel) {
//         String left = widget.motor[index].left.toString();
//         String right = widget.motor[index].right.toString();
//         item.controllerLeft.text =
//             left.isEmpty ? "0" : left;
//         item.controllerRight.text =
//             right.isEmpty ? "0" : right;
//         return DataRow(
//           cells: [
//             DataCell(
//               Text(item.labelName),
//             ),
//             DataCell(
//               placeholder: true,
//               DropdownButton4(
//                 value: item.controllerLeft.text,
//                 onChanged: (value) {
//                   setState(() {
//                     left = value ?? "0";
//                     item.controllerLeft.text = value!;
//                   });
//                 },
//                 itemList: const ["0", "1", "2", "3"],
//               ),
//             ),
//             DataCell(
//               placeholder: false,
//               DropdownButton4(
//                 itemList: const ["0", "1", "2", "3"],
//                 value: item.controllerRight.text,
//                 onChanged: (value) {
//                   setState(() {
//                     right = value ?? "0";
//                     item.controllerRight.text = value!;
//                   });
//                 },
//               ),
//             ),
//           ],
//         );
//       }
//       return const DataRow(cells: []);
//     },
//   ),
// );

// ShowDialogItems(
//   name: model.name,
//   contecnt: SizedBox(
//     height: MediaQuery.sizeOf(context).height / 1.2,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 20, vertical: 10),
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               addAutomaticKeepAlives: true,
//               itemCount: model.itemList.length,
//               itemBuilder: (context, idx) {
//                 final item = model.itemList[idx];
//                 if (item is TextFormFiledStepperModel) {
//                   return TextFormFiledStepper(
//                       onChanged: (p0) {
//                         motor[index].answer = p0 ?? "null";
//                       },
//                       initialValue: motor[index].answer,
//                       labelname: item.labelName,
//                       textEditingController:
//                           item.textEditingController);
//                 }
//                 if (item is TextFormFiledRightLiftModel) {
//                   String left =
//                       motor[index].left.toString();
//                   String right =
//                       motor[index].right.toString();
//                   item.controllerLeft.text = left;
//                   item.controllerRight.text = right;

//                   return RightLeftTextFiled(
//                     onChangedLeft: (p0) {
//                       left = p0 ?? "null";
//                     },
//                     onChangedRight: (p0) {
//                       right = p0 ?? "null";
//                     },
//                     initialValueLeft: left,
//                     initialValueRight: right,
//                     title: item.labelName,
//                     controllerRight: item.controllerRight,
//                     controllerLeft: item.controllerLeft,
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ),
//           ButtonText(
//               text: 'Save',
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }),
//         ],
//       ),
//     ),
//   ),
// );
// }

// DataCell(
// TextFormFiledTableData(
//   onChanged: (p0) {
//     right = p0;
//   },
//   textEditingController: item.controllerRight,
//   initialValue: right,
// )
// ),

// ignore: must_be_immutable
class TextFormFiledTableData extends StatelessWidget {
  TextFormFiledTableData(
      {super.key,
      required this.textEditingController,
      this.initialValue,
      this.onChanged});
  late TextEditingController textEditingController;
  final String? initialValue;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primarycolor))),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      // initialValue: widget.initialValue,
      controller: textEditingController,
      onChanged: onChanged,
    );
  }
}

// ShowDialogItems(
//   name: ' Muscle strength',
//   contecnt: SizedBox(
//     height: MediaQuery.sizeOf(context).height / 1.2,
//     child: Padding(
//       padding:
//           const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: ListView(
//         children: [
//           const DividerItem(text: 'Muscle strength'),
//           RightLeftTextFiled(
//               title: 'Gluteal',
//               controllerRight: controlBodyFunction.glutealRight,
//               controllerLeft: controlBodyFunction.glutealLeft),
//           RightLeftTextFiled(
//               title: 'Abductors',
//               controllerRight: controlBodyFunction.abductorsRight,
//               controllerLeft: controlBodyFunction.abductorsLeft),
//           RightLeftTextFiled(
//               title: 'Adductor',
//               controllerRight: controlBodyFunction.adductorsRight,
//               controllerLeft: controlBodyFunction.adductorsLeft),
//           RightLeftTextFiled(
//               title: 'Hip flexors',
//               controllerRight: controlBodyFunction.hipFlexorsRight,
//               controllerLeft: controlBodyFunction.hipFlexorsLeft),
//           RightLeftTextFiled(
//               title: 'Hip IR',
//               controllerRight: controlBodyFunction.hipIRRight,
//               controllerLeft: controlBodyFunction.hipIRLeft),
//           RightLeftTextFiled(
//               title: 'Hip ER',
//               controllerRight: controlBodyFunction.hipERRight,
//               controllerLeft: controlBodyFunction.hipERLeft),
//           RightLeftTextFiled(
//               title: 'Quadriceps',
//               controllerRight: controlBodyFunction.quadricepsRight,
//               controllerLeft: controlBodyFunction.quadricepsLeft),
//           RightLeftTextFiled(
//               title: 'Hamstring',
//               controllerRight: controlBodyFunction.hamstringRight,
//               controllerLeft: controlBodyFunction.hamstringLeft),
//           RightLeftTextFiled(
//               title: 'Plantar flexors',
//               controllerRight:
//                   controlBodyFunction.plantarFlexorsRight,
//               controllerLeft:
//                   controlBodyFunction.plantarFlexorsLeft),
//           RightLeftTextFiled(
//               title: 'Dorsiflexors',
//               controllerRight:
//                   controlBodyFunction.dorsiflexorsRight,
//               controllerLeft: controlBodyFunction.dorsiflexorsLeft),
//           RightLeftTextFiled(
//               title: 'Shoulder flexors',
//               controllerRight:
//                   controlBodyFunction.shoulderFlexorsRight,
//               controllerLeft:
//                   controlBodyFunction.shoulderFlexorsLeft),
//           RightLeftTextFiled(
//               title: 'Shoulder Extensors',
//               controllerRight:
//                   controlBodyFunction.shoulderExtensorsRight,
//               controllerLeft:
//                   controlBodyFunction.shoulderExtensorsLeft),
//           RightLeftTextFiled(
//               title: 'Shoulder',
//               controllerRight: controlBodyFunction.shoulderRight,
//               controllerLeft: controlBodyFunction.shoulderLeft),
//           RightLeftTextFiled(
//               title: 'Shoulder IR',
//               controllerRight: controlBodyFunction.shoulderIRRight,
//               controllerLeft: controlBodyFunction.shoulderIRLeft),
//           RightLeftTextFiled(
//               title: 'Shoulder ER',
//               controllerRight: controlBodyFunction.shoulderERRight,
//               controllerLeft: controlBodyFunction.shoulderERLeft),
//           RightLeftTextFiled(
//               title: 'Elbow Flexors',
//               controllerRight:
//                   controlBodyFunction.elbowFlexorsRight,
//               controllerLeft: controlBodyFunction.elbowFlexorsLeft),
//           RightLeftTextFiled(
//               title: 'Elbow Extensors',
//               controllerRight:
//                   controlBodyFunction.elbowExtensorsRight,
//               controllerLeft:
//                   controlBodyFunction.elbowExtensorsLeft),
//           RightLeftTextFiled(
//               title: 'Wrist Flexors',
//               controllerRight:
//                   controlBodyFunction.wristFlexorsRight,
//               controllerLeft: controlBodyFunction.wristFlexorsLeft),
//           RightLeftTextFiled(
//               title: 'Wrist Extensors',
//               controllerRight:
//                   controlBodyFunction.wristExtensorsRight,
//               controllerLeft:
//                   controlBodyFunction.wristExtensorsLeft),
//           ButtonText(
//               text: 'Save',
//               onPressed: () {
//                 Navigator.pop(context);
//               })
//         ],
//       ),
//     ),
//   ),
// ),
// TextFormFiledStepper(
//     labelname: 'Muscle Tone',
//     textEditingController: controlBodyFunction.muscleTon),
// ShowDialogItems(
//   name: ' Muscle Tone',
//   contecnt: SizedBox(
//     height: MediaQuery.sizeOf(context).height / 1.2,
//     child: Padding(
//       padding:
//           const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const DividerItem(text: 'Muscle Tone '),
//             RightLeftTextFiled(
//                 title: 'Adductors (Knee flexion)',
//                 controllerRight: controlBodyFunction
//                     .adductorsKneeFlexionTonRight,
//                 controllerLeft: controlBodyFunction
//                     .adductorsKneeFlexionTonLeft),
//             RightLeftTextFiled(
//                 title: 'Adductors (Knee Extension)',
//                 controllerRight: controlBodyFunction
//                     .adductorsKneeExtensionTonRight,
//                 controllerLeft: controlBodyFunction
//                     .adductorsKneeExtensionTonLeft),
//             RightLeftTextFiled(
//                 title: 'Illiospoas',
//                 controllerRight:
//                     controlBodyFunction.illiospoasTonRight,
//                 controllerLeft:
//                     controlBodyFunction.illiospoasTonLeft),
//             RightLeftTextFiled(
//                 title: 'Hip IR',
//                 controllerRight:
//                     controlBodyFunction.hipIRtonTonRight,
//                 controllerLeft:
//                     controlBodyFunction.hipIRtonTonLeft),
//             RightLeftTextFiled(
//                 title: 'Hip ER',
//                 controllerRight:
//                     controlBodyFunction.hipERtonTonRight,
//                 controllerLeft:
//                     controlBodyFunction.hipERtonTonLeft),
//             RightLeftTextFiled(
//                 title: 'Quadriceps',
//                 controllerRight:
//                     controlBodyFunction.quadricepsTonRight,
//                 controllerLeft:
//                     controlBodyFunction.quadricepsTonLeft),
//             RightLeftTextFiled(
//                 title: 'Hamstring',
//                 controllerRight:
//                     controlBodyFunction.hamstringTonRight,
//                 controllerLeft:
//                     controlBodyFunction.hamstringTonLeft),
//             RightLeftTextFiled(
//                 title: 'Gastrocnemius',
//                 controllerRight:
//                     controlBodyFunction.gastrocnemiusTonRight,
//                 controllerLeft:
//                     controlBodyFunction.gastrocnemiusTonLeft),
//             RightLeftTextFiled(
//                 title: 'Soleus',
//                 controllerRight: controlBodyFunction.soleusTonRight,
//                 controllerLeft: controlBodyFunction.soleusTonLeft),
//             RightLeftTextFiled(
//                 title: 'Tibialis Ant',
//                 controllerRight:
//                     controlBodyFunction.tibialisAntTonRight,
//                 controllerLeft:
//                     controlBodyFunction.tibialisAntTonLeft),
//             RightLeftTextFiled(
//                 title: 'Tibialis Post',
//                 controllerRight:
//                     controlBodyFunction.tibialisPostTonRight,
//                 controllerLeft:
//                     controlBodyFunction.tibialisPostTonLeft),
//             RightLeftTextFiled(
//                 title: 'Shoulder',
//                 controllerRight:
//                     controlBodyFunction.shoulderTonRight,
//                 controllerLeft:
//                     controlBodyFunction.shoulderTonLeft),
//             RightLeftTextFiled(
//                 title: 'Adductors',
//                 controllerRight:
//                     controlBodyFunction.adductorsTonRight,
//                 controllerLeft:
//                     controlBodyFunction.adductorsTonLeft),
//             RightLeftTextFiled(
//                 title: 'Shoulder ER',
//                 controllerRight:
//                     controlBodyFunction.shoulderERTonRight,
//                 controllerLeft:
//                     controlBodyFunction.shoulderERTonLeft),
//             RightLeftTextFiled(
//                 title: 'Shoulder IR',
//                 controllerRight:
//                     controlBodyFunction.shoulderIRTonRight,
//                 controllerLeft:
//                     controlBodyFunction.shoulderIRTonLeft),
//             RightLeftTextFiled(
//                 title: 'Elbow Flexors',
//                 controllerRight:
//                     controlBodyFunction.elbowFlexorsTonRight,
//                 controllerLeft:
//                     controlBodyFunction.elbowFlexorsTonLeft),
//             RightLeftTextFiled(
//                 title: 'Wrist Flexors',
//                 controllerRight:
//                     controlBodyFunction.wristFlexorsTonRight,
//                 controllerLeft:
//                     controlBodyFunction.wristFlexorsTonLeft),
//             RightLeftTextFiled(
//                 title: 'Finger Flexors',
//                 controllerRight:
//                     controlBodyFunction.fingerFlexorsTonRight,
//                 controllerLeft:
//                     controlBodyFunction.fingerFlexorsTonLeft),
//             ButtonText(
//                 text: 'Save',
//                 onPressed: () {
//                   Navigator.pop(context);
//                 })
//           ],
//         ),
//       ),
//     ),
//   ),
// ),
// DropdownButtonItem(
//     controller: controlBodyFunction.muscleBulk,
//     lableName: 'Muscle Bulk',
//     itemList: const [
//       'Atrophy',
//       'Less than normal',
//       'Normal',
//       'speudo trophy'
//     ])
