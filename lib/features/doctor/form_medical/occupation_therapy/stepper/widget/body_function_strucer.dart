import 'package:flutter/material.dart';
import 'package:manaber/features/sample.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class BodyFunctionStrucer extends StatefulWidget {
  BodyFunctionStrucer(
      {super.key,
      required this.controleOccupation,
      required this.bodyFunctionStrucer});
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> bodyFunctionStrucer;

  @override
  State<BodyFunctionStrucer> createState() => _BodyFunctionStrucerState();
}

class _BodyFunctionStrucerState extends State<BodyFunctionStrucer> {
  final List<String> listTitleSprated = ['Neuromuscular Status', 'Balance'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Function Strucer'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              if (index == 2) {
                return DividerItem(text: listTitleSprated[1]);
              }

              return const SizedBox.shrink();
            },
            itemCount: widget.controleOccupation.listOfBodyFunctionStrucer.length,
            itemBuilder: (context, index) {
              // if (index == 0) {
              //   return DividerItem(text: listTitleSprated[0]);
              // }
              var model = widget.controleOccupation.listOfBodyFunctionStrucer[index];
              if (model is ModelDropDownOccupation) {
                model.textEditingController.text =
                    widget.bodyFunctionStrucer[index].answer ?? model.itemList.first;
                return 
                CustomDropdownButton2(
                  hint: model.lableName,
                  value: model.textEditingController.text,
                  dropdownItems: model.itemList,
                  onChanged: (value) {
                    setState(() {
                    widget.bodyFunctionStrucer[index].answer = value ?? "null";  
                    });
                    
                  },
                );
                // DropdownButtonItem(
                //   onChanged: (p0) {
                //     bodyFunctionStrucer[index].answer = p0 ?? "null";
                //   },
                //   controller: model.textEditingController,
                //   labelName: model.lableName,
                //   itemList: model.itemList,
                // );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    onChanged: (p0) {
                      widget.bodyFunctionStrucer[index].answer = p0 ?? "null";
                    },
                    initialValue: widget.bodyFunctionStrucer[index].answer,
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }
              // if (model is ModelDividerOccupation) {
              //   return DividerItem(text: model.text);
              // }

              return const SizedBox.shrink();
            },
            addAutomaticKeepAlives: true,
          )),
    );
  }
}

/*
const DividerItem(text: 'Neuromuscular Status'),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer
                        .neuromuscularStatusUpperLimb,
                    lableName: 'Upper limb',
                    itemList: const [
                      "Spastic",
                      "Flaccid",
                      "Normal",
                    ]),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer
                        .neuromuscularStatusLowerLimb,
                    lableName: 'Lower limb',
                    itemList: const [
                      "Spastic",
                      "Flaccid",
                      "Normal",
                    ]),
                TextFormFiledStepper(
                    labelname: 'Note',
                    textEditingController:
                        controlerBodyFunctionStrucer.neuromuscularStatusNote),
                const DividerItem(text: 'balance '),
                TextFormFiledStepper(
                    labelname: 'Sitting Balance Static',
                    textEditingController:
                        controlerBodyFunctionStrucer.sittingBalanceStatic),
                TextFormFiledStepper(
                    labelname: 'Sitting balance dynamic',
                    textEditingController:
                        controlerBodyFunctionStrucer.sittingBalanceDynamic),
                TextFormFiledStepper(
                    labelname: 'Posture',
                    textEditingController:
                        controlerBodyFunctionStrucer.posture),
                TextFormFiledStepper(
                    labelname: 'Gait ',
                    textEditingController: controlerBodyFunctionStrucer.gait),
                TextFormFiledStepper(
                    labelname: 'Deformities',
                    textEditingController:
                        controlerBodyFunctionStrucer.deformities),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.musclebulk,
                    lableName: 'Muscle bulk',
                    itemList: const [
                      "Normal",
                      "atrophy",
                      "less than normal",
                      "speudo trophy"
                    ]),
                TextFormFiledStepper(
                    labelname: 'Leg Length Discrepancy ',
                    textEditingController:
                        controlerBodyFunctionStrucer.legLengthDiscrepancy),
                TextFormFiledStepper(
                    labelname: 'Skin Condition',
                    textEditingController:
                        controlerBodyFunctionStrucer.skinCondition),
                TextFormFiledStepper(
                    labelname: 'Assistive Devices',
                    textEditingController:
                        controlerBodyFunctionStrucer.assistiveDevices),
*/ 
