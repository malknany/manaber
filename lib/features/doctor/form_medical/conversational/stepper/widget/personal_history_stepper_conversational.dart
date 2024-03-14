import 'package:flutter/material.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../model.dart';
import '../controler.dart';

class PersonalHistoryConversational extends StatelessWidget {
  const PersonalHistoryConversational(
      {super.key,
      required this.controleConversational,
      required this.personalHistory});
  final ControleConversational controleConversational;
  final List<ModelPatientInfo> personalHistory;

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
      body: Scrollbar(
        interactive: true,
        radius: const Radius.circular(20),
        thickness: 10,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: ListView(
              addAutomaticKeepAlives: true,
              children: List.generate(
                  controleConversational.listOfPersonal.length, (index) {
                return TextFormFiledStepper(
                    onChanged: (p0) {
                      personalHistory[index].answer = p0 ?? "null";
                    },
                    initialValue: personalHistory[index].answer,
                    textDirection: TextDirection.rtl,
                    textEditingController:
                        controleConversational.listOfPersonal[index].controle,
                    labelname: personalHistory[index].question!);
              }),
            )),
      ),
    );
  }
}

/*
TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'اسم الطفل/ة',
                    textEditingController:
                        personalHistoryConversational.childsName),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'تاریخ المیلاد',
                    textEditingController:
                        personalHistoryConversational.dateOfBirth),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'العمر الزمني',
                    textEditingController: personalHistoryConversational.age),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'حالة الطفل/ة',
                    textEditingController:
                        personalHistoryConversational.childCondition),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'تاریخ الكشف',
                    textEditingController:
                        personalHistoryConversational.examinationDate),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'اسم ولي الامر',
                    textEditingController:
                        personalHistoryConversational.parentsName),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'مستوي تعلیم الأب',
                    textEditingController:
                        personalHistoryConversational.fathersEducationLevel),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'مستوى تعلیم الأم',
                    textEditingController:
                        personalHistoryConversational.motherEducationLevel),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'عمل الأب',
                    textEditingController:
                        personalHistoryConversational.fathersOccupation),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'عمل الأم',
                    textEditingController:
                        personalHistoryConversational.mothersOccupation),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'عدد أفراد الاسرة',
                    textEditingController:
                        personalHistoryConversational.numberOfFamilyMembers),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ترتیب الطفل بین أخواتھ',
                    textEditingController:
                        personalHistoryConversational.childsBirthOrder),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل یوجد درجه القرابه بین الوالدین',
                    textEditingController: personalHistoryConversational
                        .relationshipBetweenTheParents),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'مع من یقیم الطفل',
                    textEditingController: personalHistoryConversational
                        .placeOfResidenceOfTheChild),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: ' المسؤول عن رعایة الطفل في المنزل',
                    textEditingController:
                        personalHistoryConversational.childCareAtHome),
                TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  labelname: ' ھل الطفل متكیف  في الاسرة',
                  textEditingController:
                      personalHistoryConversational.childAdaptedToTheFamily,
                ),
                const DividerItem(text: 'التاریخ الصحي للأسرة'),
                TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  labelname: ' ھل توجد أمراض وراثیة في الأسرة ',
                  textEditingController:
                      personalHistoryConversational.hereditaryDiseases,
                ),
*/ 