import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class AssociatedDisorders extends StatelessWidget {
  const AssociatedDisorders(
      {super.key,
      required this.controleOccupation,
      required this.associatedDisorders});
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> associatedDisorders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Associated Disorders'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView(
            children: List.generate(
              controleOccupation.listOfAssociatedDisorders.length,
              (index) {
                var model = controleOccupation.listOfAssociatedDisorders[index];
                if (model is ModelDropDownOccupation) {
                  return DropdownButtonItem(
                    controller: model.textEditingController,
                    labelName: model.lableName,
                    itemList: model.itemList,
                  );
                }
                if (model is ModelTextFiledOccupation) {
                  return TextFormFiledStepper(
                      hintText: associatedDisorders[index].answer,
                      textInputType: model.textInputType,
                      labelname: model.labelname,
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
