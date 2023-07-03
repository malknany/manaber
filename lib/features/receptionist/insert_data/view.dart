import 'package:flutter/material.dart';
import 'package:manaber/features/receptionist/insert_data/controler.dart';

import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class ReceptionistDataEntry extends StatelessWidget {
  const ReceptionistDataEntry({
    required this.controleReceptionist,
    super.key,
  });

  final StepperReceptionist controleReceptionist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البیانات الأولیة'),
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
                    labelname: 'الاسم',
                    textEditingController: controleReceptionist.controle1),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'صلة القرابة بين الاب والام',
                    textEditingController: controleReceptionist.controle2),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'هل حدث مشكلة اثناء الولادة ؟ ماهي',
                    textEditingController: controleReceptionist.controle3),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'كم وزن الطفل اثناء الولادة ؟',
                    textEditingController: controleReceptionist.controle4),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'هل اخذ طفلك جميع التطعيمات؟',
                    textEditingController: controleReceptionist.controle5),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ماهي الادوية الحالية لطفلك ان وجدت',
                    textEditingController: controleReceptionist.controle6),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'هل يعاني طفلك من أي نوع من انواع التشنجات',
                    textEditingController: controleReceptionist.controle7),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname:
                        'هل لدية مشاكل اخرى غير المشاكل الحركية (مثل مشاكل بالرئة او القلب)',
                    textEditingController: controleReceptionist.controle8),
                DropdownButtonItem(
                    textDirection: TextDirection.rtl,
                    lableName: 'هل يوجد اطفال يعانون من نفس المشكلة بالعائلة',
                    itemList: ['نعم', 'لا'],
                    controller: controleReceptionist.controle9),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'هل اجريت لطفلك تحليل للجينات من قبل؟ ',
                    textEditingController: controleReceptionist.controle10),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'هل توجد مشكلة جينية من الاساس ام لا؟',
                    textEditingController: controleReceptionist.controle10),
                ButtonText(
                    text: 'حفظ',
                    onPressed: () {
                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text(
                          'تم رفع المعلومات ',
                          style: AppTextStyles.lrTitles
                              .copyWith(color: Colors.white),
                        ),
                        backgroundColor: AppColors.primarycolor,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).pop();
                    })
              ],
            ),
          )),
    );
  }
}
