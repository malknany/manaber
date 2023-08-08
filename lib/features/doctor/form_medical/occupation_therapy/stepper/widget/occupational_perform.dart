import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class OccupationalPerformance extends StatelessWidget {
  const OccupationalPerformance({super.key, required this.controleOccupation,required this.occupationalPerformance});
  // final StepperOccupationPreformance controlerOccupationPreformance;
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> occupationalPerformance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Occupational Performance'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.builder(
            itemCount:
                controleOccupation.listOfOccupationPreformance.length - 1,
            itemBuilder: (context, index) {
              var model = controleOccupation.listOfOccupationPreformance[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  lableName: model.lableName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                  hintText: occupationalPerformance[index].answer??'',
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
}
