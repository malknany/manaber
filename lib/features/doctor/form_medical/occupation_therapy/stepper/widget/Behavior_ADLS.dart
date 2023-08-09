// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/controler.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class BehaviorADLS extends StatefulWidget {
  const BehaviorADLS(
      {super.key,
      required this.controleOccupation,
      required this.behaviorADLS});
  final List<ModelPatientInfo> behaviorADLS;
  final ControleOccupation controleOccupation;

  @override
  State<BehaviorADLS> createState() => _BehaviorADLSState();
}

class _BehaviorADLSState extends State<BehaviorADLS>
    with AutomaticKeepAliveClientMixin<BehaviorADLS> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          child: ListView.builder(
            itemCount: widget.controleOccupation.listOfBehaviorADLS.length,
            itemBuilder: (context, index) {
              var model = widget.controleOccupation.listOfBehaviorADLS[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  labelName: model.lableName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    hintText: widget.behaviorADLS[index].answer ?? '',
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }
              if (model is ModelDividerOccupation) {
                return DividerItem(text: model.text);
              }

              return const SizedBox.shrink();
            },
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
