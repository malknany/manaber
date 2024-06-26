import 'package:flutter/material.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../controler.dart';

class MedicalAndGeneticHistoryOfTheFamily extends StatelessWidget {
  const MedicalAndGeneticHistoryOfTheFamily(
      {super.key,
      required this.controlConversational,
      required this.medicalAndGeneticHistoryOfTheFamily});
  final ControlConversational controlConversational;
  final List<ModelPatientInfo> medicalAndGeneticHistoryOfTheFamily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التاریخ المرضي والوراثي للعائلة'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TextFormFiledStepper(
                    hintText: medicalAndGeneticHistoryOfTheFamily[index].answer,
                    textDirection: TextDirection.rtl,
                    labelName:
                        medicalAndGeneticHistoryOfTheFamily[index].question!,
                    textEditingController: controlConversational
                        .listOfMedicalAndGeneticHistoryOfTheFamily[index]
                        .control);
              },
              separatorBuilder: (context, index) {
                if (index == 2) {
                  return const DividerItem(text: 'تاریخ الحمل والولادة ');
                } else {
                  return const SizedBox.shrink();
                }
              },
              itemCount: controlConversational
                  .listOfMedicalAndGeneticHistoryOfTheFamily.length)),
    );
  }
}
