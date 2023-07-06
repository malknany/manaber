import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class MedicalAndGeneticHistoryOfTheFamilyView extends StatelessWidget {
  const MedicalAndGeneticHistoryOfTheFamilyView(
      {super.key, required this.controlerMedicalAndGeneticHistoryOfTheFamily});
  final StepperMedicalAndGeneticHistoryOfTheFamily
      controlerMedicalAndGeneticHistoryOfTheFamily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.primarycolor,
      //   elevation: 0,
      //   child: const Icon(Icons.edit_outlined),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'التاریخ المرضي والوراثي للعائلة',
          style: TextStyle(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.conversational)),
                const Text(
                  "دراسه الحالة",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یوجد أي حالات مشابھھ أو أعاقات أخرى",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle1.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل أجرى الأب والأم الصفوحات الجینیة",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle2.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یعتقد الأطباء الاضطراب ناتج عن عوامل وراثیة",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle3.text),
                const Text('تاریخ الحمل والولادة'),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "عمر الأم عند الولادة",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle4.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "طول فتره الحمل",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle5.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل عانت الأم من أي امراض قبل الحمل",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle6.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل اصیبت الأم من أي أمراض اثناء الحمل",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle7.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title:
                        "ھل عانت الأم من التعب والارھاق الحاد اثناء فترة الحمل",
                    value: controlerMedicalAndGeneticHistoryOfTheFamily
                        .controle8.text),
              ],
            ),
          )),
    );
  }
}
