// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/controler.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class BehaviorADLS extends StatelessWidget {
  const BehaviorADLS(
      {super.key,
      required this.controlOccupation,
      required this.behaviorADLS});
  final List<ModelPatientInfo> behaviorADLS;
  final ControlOccupation controlOccupation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Behavior And ADLS'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView(
            children: List.generate(
                controlOccupation.listOfBehaviorADLS.length, (index) {
              var model = controlOccupation.listOfBehaviorADLS[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  labelName: model.labelName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    hintText: behaviorADLS[index].answer,
                    textInputType: model.textInputType,
                    labelName: model.labelname,
                    textEditingController: model.textEditingController);
              }
              if (model is ModelDividerOccupation) {
                return DividerItem(text: model.text);
              }

              return const SizedBox.shrink();
            }),
          )),
    );
  }
}
