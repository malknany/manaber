import 'package:flutter/material.dart';
import 'model.dart';

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
  final StepperChildMedicalAndMedicalHistory childMedicalAndMedicalHistory =
      StepperChildMedicalAndMedicalHistory();
  final StepperChildDevelopmentalHistory contolrChildDevelopmentalHistory =
      StepperChildDevelopmentalHistory();
  final StepperNoteConversation controleNoteConversation =
      StepperNoteConversation();
  List<ModelConversational> listOfPersonal = [];
  List<ModelConversational> listOfMedicalAndGeneticHistoryOfTheFamily = [];
  List<ModelConversational> listOfChildMedicalAndMedicalHistory = [];
  List<ModelConversational> listOfChildDevelopmentalHistory = [];
  List<ModelConversational> listOfNoteConversation = [];
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
    listOfMedicalAndGeneticHistoryOfTheFamily = [
      ModelConversational(
          lable: 'ھل یوجد أي حالات مشابه أو أعاقات أخرى',
          controle: controleMedical.controle1),
      ModelConversational(
          lable: 'ھل أجرى الأب والأم الصفوحات الجینیة',
          controle: controleMedical.controle2),
      ModelConversational(
          lable: 'ھل یعتقد الأطباء الاضطراب ناتج عن عوامل وراثیة',
          controle: controleMedical.controle3),
      ModelConversational(
          lable: 'عمر الأم عند الولادة', controle: controleMedical.controle4),
      ModelConversational(
          lable: 'طول فتره الحمل', controle: controleMedical.controle5),
      ModelConversational(
          lable: 'ھل عانت الأم من أي امراض قبل الحمل',
          controle: controleMedical.controle6),
      ModelConversational(
          lable: 'ھل اصیبت الأم من أي أمراض اثناء الحمل',
          controle: controleMedical.controle7),
      ModelConversational(
          lable: 'ھل عانت الأم من التعب والارھاق الحاد اثناء فترة الحمل',
          controle: controleMedical.controle8),
    ];
    listOfChildMedicalAndMedicalHistory = [
      ModelConversational(
          lable: 'متى اكتشفت الأسرة الاضطراب',
          controle: childMedicalAndMedicalHistory.controle1),
      ModelConversational(
          lable: 'ھل أصیب الطفل بأي أمراض حادة أو حوادث أثرت على تطوره ونموه',
          controle: childMedicalAndMedicalHistory.controle2),
      ModelConversational(
          lable: 'ھل یعاني الطفل من مشكلات سمعیة',
          controle: childMedicalAndMedicalHistory.controle3),
      ModelConversational(
          lable: 'ھل یعاني الطفل من مشكلات بصریة',
          controle: childMedicalAndMedicalHistory.controle4),
      ModelConversational(
          lable: 'ھل یعاني الطفل من أي تشوھات خلقیھ',
          controle: childMedicalAndMedicalHistory.controle5),
      ModelConversational(
          lable: 'ھل یعاني الطفل من مشكلات في تناول الطعام أو الشراب',
          controle: childMedicalAndMedicalHistory.controle6),
      ModelConversational(
          lable: 'ھل یعاني الطفل من نوبات تشنجات',
          controle: childMedicalAndMedicalHistory.controle7),
      ModelConversational(
          lable: 'ھل یعاني الطفل من الحساسیة لأدویھ أو أطعمھ معینه',
          controle: childMedicalAndMedicalHistory.controle8),
      ModelConversational(
          lable: 'ھل أجري الطفل عملیات جراحیة',
          controle: childMedicalAndMedicalHistory.controle9),
      ModelConversational(
          lable: 'ھل یتناول الطفل أدویھ أو عقاقیر حالیا',
          controle: childMedicalAndMedicalHistory.controle10),
      ModelConversational(
          lable: 'ھل مازال الطفل یستخدم الحفاظ',
          controle: childMedicalAndMedicalHistory.controle11),
    ];
    listOfChildDevelopmentalHistory = [
      ModelConversational(
          lable: 'مستوى النمو اللغوي الحالي',
          controle: contolrChildDevelopmentalHistory.controle1),
      ModelConversational(
          lable: 'مستوى النمو الحركي الحالي',
          controle: contolrChildDevelopmentalHistory.controle2),
      ModelConversational(
          lable: 'مستوى المھارات الوظیفیة الاستقلالیة الحالیة',
          controle: contolrChildDevelopmentalHistory.controle3),
      ModelConversational(
          lable: 'مستوى المھارات الادراكیة والمعرفیة الحالیة',
          controle: contolrChildDevelopmentalHistory.controle4),
      ModelConversational(
          lable: 'نشاط حركي زائد',
          controle: contolrChildDevelopmentalHistory.controle5),
      ModelConversational(
          lable: 'تشتت انتباه والتركیز',
          controle: contolrChildDevelopmentalHistory.controle6),
      ModelConversational(
          lable: 'سلوك عدواني',
          controle: contolrChildDevelopmentalHistory.controle7),
      ModelConversational(
          lable: 'سلوك العناد',
          controle: contolrChildDevelopmentalHistory.controle8),
      ModelConversational(
          lable: 'سلوكیات أخرى',
          controle: contolrChildDevelopmentalHistory.controle9),
    ];
    listOfNoteConversation = [
      ModelConversational(
          lable: 'المعززات', controle: controleNoteConversation.reinforcers),
      ModelConversational(
          lable: 'الاھداف المبدئیة',
          controle: controleNoteConversation.initialGoals),
      ModelConversational(
          lable: 'ملاحظات', controle: controleNoteConversation.note),
    ];
  }
}
