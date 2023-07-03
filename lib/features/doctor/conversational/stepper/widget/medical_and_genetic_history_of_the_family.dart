import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class MedicalAndGeneticHistoryOfTheFamily extends StatelessWidget {
  const MedicalAndGeneticHistoryOfTheFamily(
      {super.key, required this.controlerMedicalAndGeneticHistoryOfTheFamily});
  final StepperMedicalAndGeneticHistoryOfTheFamily controlerMedicalAndGeneticHistoryOfTheFamily;

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل یوجد أي حالات مشابه أو أعاقات أخرى ',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle1),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل أجرى الأب والأم الصفوحات الجینیة ',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle2),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname:
                        'ھل یعتقد الأطباء الاضطراب ناتج عن عوامل وراثیة ',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle3),
                const DividerItem(text: 'تاریخ الحمل والولادة '),
                TextFormFiledStepper(
                    textInputType: TextInputType.number,
                    textDirection: TextDirection.rtl,
                    labelname: 'عمر الأم عند الولادة',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle4),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'طول فتره الحمل ',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle5),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل عانت الأم من أي امراض قبل الحمل ',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle6),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل اصیبت الأم من أي أمراض اثناء الحمل ',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle7),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل عانت الأم من التعب والارھاق الحاد اثناء فترة الحمل ',
                    textEditingController:
                        controlerMedicalAndGeneticHistoryOfTheFamily.controle8),
              ],
            ),
          )),
    );
  }
}
