import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/model.dart';
import '../controler.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class AssociatedDisorders extends StatelessWidget {
  const AssociatedDisorders({super.key, required this.controleOccupation});
  final ControleOccupation controleOccupation;

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
          child: ListView.builder(
            itemCount: controleOccupation.listOfAssociatedDisorders.length,
            itemBuilder: (context, index) {
              var model = controleOccupation.listOfAssociatedDisorders[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  lableName: model.lableName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }
              if (model is ModelDividerOccupation) {
                return DividerItem(text: model.text);
              }

              return SizedBox.shrink();
            },
          )),
    );
  }
}
