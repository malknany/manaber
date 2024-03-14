// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/controler.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/model.dart';
import 'package:manaber/features/sample.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class BehaviorADLS extends StatefulWidget {
  BehaviorADLS(
      {super.key,
      required this.controleOccupation,
      required this.behaviorADLS});
  final List<ModelPatientInfo> behaviorADLS;
  final ControleOccupation controleOccupation;

  @override
  State<BehaviorADLS> createState() => _BehaviorADLSState();
}

class _BehaviorADLSState extends State<BehaviorADLS> {
  final List<String> listTitleSprated = ['Behavior', 'A.D.L.S'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Behavior And ADLS'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              if (index == 4) {
                return DividerItem(text: listTitleSprated[1]);
              }

              return const SizedBox.shrink();
            },
            itemCount: widget.controleOccupation.listOfBehaviorADLS.length,
            itemBuilder: (context, index) {
              var model = widget.controleOccupation.listOfBehaviorADLS[index];
              // if (index == 0) {
              //   return DividerItem(text: listTitleSprated[0]);
              // }
              if (model is ModelDropDownOccupation) {
                model.textEditingController.text =
                    widget.behaviorADLS[index].answer ?? model.itemList.first;
                return CustomDropdownButton2(
                  hint: model.lableName,
                  value: model.textEditingController.text,
                  dropdownItems: model.itemList,
                  onChanged: (value) {
                    setState(() {
                      widget.behaviorADLS[index].answer = value ?? "null";
                    });
                  },
                );
                // DropdownButtonItem(
                //   onChanged: (p0) {
                //     behaviorADLS[index].answer = p0 ?? "null";
                //     print(behaviorADLS[index].answer);
                //   },
                //   controller: model.textEditingController,
                //   labelName: model.lableName,
                //   itemList: model.itemList,
                // );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    onChanged: (p0) {
                      widget.behaviorADLS[index].answer = p0 ?? "null";
                    },
                    initialValue: widget.behaviorADLS[index].answer,
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }
              if (model is ModelDividerOccupation) {
                return DividerItem(text: model.text);
              }

              return const SizedBox.shrink();
            },
            addAutomaticKeepAlives: true,
          )),
    );
  }
}
