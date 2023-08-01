import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class PersonalHistoryConversationalView extends StatelessWidget {
  const PersonalHistoryConversationalView(
      {super.key, required this.modelPersonalHistory});

  final List<ModelPatientInfo> modelPersonalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'البیانات الأولیة',
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
              children: List.generate(modelPersonalHistory.length, (index) {
                return InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: modelPersonalHistory[index].question!,
                    value: modelPersonalHistory[index].answer ?? '');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
             
// InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "تاریخ المیلاد",
              //     value: controlePersonalHistory.dateOfBirth.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "العمر الزمني",
              //     value: controlePersonalHistory.age.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "حالة الطفل",
              //     value: controlePersonalHistory.childCondition.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "تاریخ الكشف",
              //     value: controlePersonalHistory.examinationDate.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "اسم ولي الامر",
              //     value: controlePersonalHistory.parentsName.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "مستوي تعلیم الأب",
              //     value: controlePersonalHistory.fathersEducationLevel.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "مستوى تعلیم الأم",
              //     value: controlePersonalHistory.motherEducationLevel.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "عمل الأب",
              //     value: controlePersonalHistory.fathersOccupation.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "عمل الأم",
              //     value: controlePersonalHistory.mothersOccupation.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "عدد أفراد الاسرة",
              //     value: controlePersonalHistory.numberOfFamilyMembers.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "ترتیب الطفل بین أخواتھ",
              //     value: controlePersonalHistory.childsBirthOrder.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "ھل یوجد درجھ القرابھ بین الوالدین",
              //     value: controlePersonalHistory
              //         .relationshipBetweenTheParents.text),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: "مع من یقیم الطفل",
              //     value: controlePersonalHistory
              //         .placeOfResidenceOfTheChild.text),
              // InfoRowItem(
              //   textDirection: TextDirection.rtl,
              //   title: "المسؤول عن رعایة الطفل في المنزل ",
              //   value: controlePersonalHistory.childCareAtHome.text,
              // ),
              // InfoRowItem(
              //   textDirection: TextDirection.rtl,
              //   title: "ھل الطفل متكیف في الاسرة ",
              //   value: controlePersonalHistory.childAdaptedToTheFamily.text,
              // ),
              // const Text('التاریخ الصحي للأسرة'),
              // InfoRowItem(
              //     textDirection: TextDirection.rtl,
              //     title: 'ھل توجد أمراض وراثیة في الأسرة',
              //     value: controlePersonalHistory.hereditaryDiseases.text)