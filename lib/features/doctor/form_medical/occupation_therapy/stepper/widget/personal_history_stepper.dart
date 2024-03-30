import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class PersonalHistory extends StatelessWidget {
  const PersonalHistory(
      {super.key,
      required this.controlOccupation,
      required this.personalHistory});
  final ControlOccupation controlOccupation;
  final List<ModelPatientInfo> personalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal History'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView(
            children: List.generate(
                controlOccupation.listOfPationHistory.length, (index) {
              var model = controlOccupation.listOfPationHistory[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  labelName: model.labelName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    hintText: personalHistory[index].answer,
                    textInputType: model.textInputType,
                    // textInputType: model.textInputType,
                    labelName: model.labelname,
                    textEditingController: model.textEditingController);
              }

              return const SizedBox.shrink();
            }),
          )),
    );
  }
}
