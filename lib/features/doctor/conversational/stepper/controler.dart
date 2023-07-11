import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/model.dart';

class StepperPersonalHistoryConversational {
  final childsName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final age = TextEditingController();
  final childCondition = TextEditingController();
  final examinationDate = TextEditingController();
  final parentsName = TextEditingController();
  final fathersEducationLevel = TextEditingController();
  final motherEducationLevel = TextEditingController();
  final fathersOccupation = TextEditingController();
  final mothersOccupation = TextEditingController();
  final numberOfFamilyMembers = TextEditingController();
  final childsBirthOrder = TextEditingController();
  final relationshipBetweenTheParents = TextEditingController();
  final placeOfResidenceOfTheChild = TextEditingController();
  final childCareAtHome = TextEditingController();
  final childAdaptedToTheFamily = TextEditingController();
  final hereditaryDiseases = TextEditingController();
}

class StepperMedicalAndGeneticHistoryOfTheFamily {
  final controle1 = TextEditingController();
  final controle2 = TextEditingController();
  final controle3 = TextEditingController();
  final controle4 = TextEditingController();
  final controle5 = TextEditingController();
  final controle6 = TextEditingController();
  final controle7 = TextEditingController();
  final controle8 = TextEditingController();
}

class StepperChildDevelopmentalHistory {
  final controle1 = TextEditingController();
  final controle2 = TextEditingController();
  final controle3 = TextEditingController();
  final controle4 = TextEditingController();
  final controle5 = TextEditingController();
  final controle6 = TextEditingController();
  final controle7 = TextEditingController();
  final controle8 = TextEditingController();
  final controle9 = TextEditingController();
}

class StepperChildMedicalAndMedicalHistory {
  final controle1 = TextEditingController();
  final controle2 = TextEditingController();
  final controle3 = TextEditingController();
  final controle4 = TextEditingController();
  final controle5 = TextEditingController();
  final controle6 = TextEditingController();
  final controle7 = TextEditingController();
  final controle8 = TextEditingController();
  final controle9 = TextEditingController();
  final controle10 = TextEditingController();
  final controle11 = TextEditingController();
}

class StepperNoteConversation {
  final reinforcers = TextEditingController();
  final initialGoals = TextEditingController();
  final note = TextEditingController();
}

class ControleConversational {
  final StepperPersonalHistoryConversational controle =
      StepperPersonalHistoryConversational();
  final StepperMedicalAndGeneticHistoryOfTheFamily controleMedical =
      StepperMedicalAndGeneticHistoryOfTheFamily();
  List<ModelConversational> listOfPersonal = [];
  List<ModelConversational> ListOfMedicalAndGeneticHistoryOfTheFamily = [];
  ControleConversational() {
    listOfPersonal = [
      ModelConversational(lable: 'اسم الطفل/ة', controle: controle.childsName),
      ModelConversational(
          lable: 'تاریخ المیلاد', controle: controle.dateOfBirth),
      ModelConversational(lable: 'العمر الزمني', controle: controle.age),
      ModelConversational(
          lable: 'حاله الطفل', controle: controle.childCondition),
      ModelConversational(
          lable: 'تاریخ الكشف', controle: controle.examinationDate),
      ModelConversational(
          lable: 'اسم ولي الامر', controle: controle.parentsName),
      ModelConversational(
          lable: 'مستوي تعلیم الأب', controle: controle.fathersEducationLevel),
      ModelConversational(
          lable: 'مستوى تعلیم الأم', controle: controle.motherEducationLevel),
      ModelConversational(
          lable: 'عمل الأب', controle: controle.fathersOccupation),
      ModelConversational(
          lable: 'عمل الأم', controle: controle.mothersOccupation),
      ModelConversational(
          lable: 'عدد أفراد الاسرة', controle: controle.numberOfFamilyMembers),
      ModelConversational(
          lable: 'ترتیب الطفل بین أخواتھ', controle: controle.childsBirthOrder),
      ModelConversational(
          lable: 'ھل یوجد درجه القرابه بین الوالدین',
          controle: controle.relationshipBetweenTheParents),
      ModelConversational(
          lable: 'مع من یقیم الطفل',
          controle: controle.placeOfResidenceOfTheChild),
      ModelConversational(
          lable: 'المسؤول عن رعایة الطفل في المنزل',
          controle: controle.childCareAtHome),
      ModelConversational(
          lable: 'ھل الطفل متكیف  في الاسرة',
          controle: controle.childAdaptedToTheFamily),
      ModelConversational(
          lable: 'ھل توجد أمراض وراثیة في الأسرة',
          controle: controle.hereditaryDiseases),
    ];
    ListOfMedicalAndGeneticHistoryOfTheFamily = [
      ModelConversational(
          lable: 'ھل یوجد أي حالات مشابه أو أعاقات أخرى', controle: controleMedical.controle1),
      ModelConversational(lable: 'ھل أجرى الأب والأم الصفوحات الجینیة', controle: controleMedical.controle2),
      ModelConversational(lable: 'ھل یعتقد الأطباء الاضطراب ناتج عن عوامل وراثیة', controle: controleMedical.controle3),
      ModelConversational(lable: 'عمر الأم عند الولادة', controle: controleMedical.controle4),
      ModelConversational(lable: 'طول فتره الحمل', controle: controleMedical.controle5),
      ModelConversational(lable: 'ھل عانت الأم من أي امراض قبل الحمل', controle: controleMedical.controle6),
      ModelConversational(lable: 'ھل اصیبت الأم من أي أمراض اثناء الحمل', controle: controleMedical.controle7),
      ModelConversational(lable: 'ھل عانت الأم من التعب والارھاق الحاد اثناء فترة الحمل', controle: controleMedical.controle8),
    ];
  }
}
