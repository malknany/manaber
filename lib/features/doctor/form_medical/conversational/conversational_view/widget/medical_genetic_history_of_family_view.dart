import 'package:flutter/material.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';
import '../../../../../../shared/styles/styles.dart';


class MedicalAndGeneticHistoryOfTheFamilyView extends StatelessWidget {
  const MedicalAndGeneticHistoryOfTheFamilyView(
      {super.key,
      required this.modelMedicalAndGeneticHistory});

  final List<ModelPatientInfo> modelMedicalAndGeneticHistory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ListView(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Image.asset(AppImages.conversational1)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'معلومات عن المريض ',
                  style: AppTextStyles.smTitles.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: List.generate(
                  modelMedicalAndGeneticHistory.length,
                  (index) => InfoRowItem(
                      textDirection: TextDirection.rtl,
                      title: modelMedicalAndGeneticHistory[index].question!,
                      value: modelMedicalAndGeneticHistory[index].answer ??
                          'لايوجد'),
                ),
              ),
            ],
          )),
    );
  }
}

/*
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
*/ 