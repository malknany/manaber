import 'package:flutter/material.dart';
import '../controler.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';

class MedicalAndGeneticHistoryOfTheFamily extends StatelessWidget {
  const MedicalAndGeneticHistoryOfTheFamily(
      {super.key, required this.controleConversational});
  final ControleConversational controleConversational;

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
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: controleConversational
                        .listOfMedicalAndGeneticHistoryOfTheFamily[index].lable,
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
    );
  }
}
