import 'package:flutter/material.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../model.dart';
import '../controler.dart';

class MedicalAndGeneticHistoryOfTheFamily extends StatelessWidget {
  const MedicalAndGeneticHistoryOfTheFamily(
      {super.key,
      required this.controleConversational,
      required this.medicalAndGeneticHistoryOfTheFamily});
  final ControleConversational controleConversational;
  final List<ModelPatientInfo> medicalAndGeneticHistoryOfTheFamily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التاریخ المرضي والوراثي للعائلة'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Scrollbar(
        interactive: true,
        radius: const Radius.circular(20),
        thickness: 10,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: ListView.separated(
                addAutomaticKeepAlives: true,
                itemBuilder: (context, index) {
                  return TextFormFiledStepper(
                      onChanged: (p0) {
                        medicalAndGeneticHistoryOfTheFamily[index].answer =
                            p0 ?? "null";
                      },
                      initialValue:
                          medicalAndGeneticHistoryOfTheFamily[index].answer,
                      textDirection: TextDirection.rtl,
                      labelname:
                          medicalAndGeneticHistoryOfTheFamily[index].question!,
                      textEditingController: controleConversational
                          .listOfMedicalAndGeneticHistoryOfTheFamily[index]
                          .controle);
                },
                separatorBuilder: (context, index) {
                  if (index == 2) {
                    return const DividerItem(text: 'تاریخ الحمل والولادة ');
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                itemCount: controleConversational
                    .listOfMedicalAndGeneticHistoryOfTheFamily.length)),
      ),
    );
  }
}
