import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class AssociatedDisorders extends StatelessWidget {
  const AssociatedDisorders(
      {super.key,
      required this.controlOccupation,
      required this.associatedDisorders});
  final ControlOccupation controlOccupation;
  final List<ModelPatientInfo> associatedDisorders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Associated Disorders'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView(
            children: List.generate(
              controlOccupation.listOfAssociatedDisorders.length,
              (index) {
                var model = controlOccupation.listOfAssociatedDisorders[index];
                if (model is ModelDropDownOccupation) {
                  return DropdownButtonItem(
                    controller: model.textEditingController,
                    labelName: model.labelName,
                    itemList: model.itemList,
                  );
                }
                if (model is ModelTextFiledOccupation) {
                  return TextFormFiledStepper(
                      hintText: associatedDisorders[index].answer,
                      textInputType: model.textInputType,
                      labelName: model.labelname,
                      textEditingController: model.textEditingController);
                }
                if (model is ModelDividerOccupation) {
                  return DividerItem(text: model.text);
                }

                return const SizedBox.shrink();
              },
            ),
          )),
    );
  }
}
