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

class ControlConversational {
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
  ControlConversational() {
    listOfPersonal = [
      ModelConversational(lable: 'اسم الطفل/ة', control: controle.childsName),
      ModelConversational(
          lable: 'تاریخ المیلاد', control: controle.dateOfBirth),
      ModelConversational(lable: 'العمر الزمني', control: controle.age),
      ModelConversational(
          lable: 'حاله الطفل', control: controle.childCondition),
      ModelConversational(
          lable: 'تاریخ الكشف', control: controle.examinationDate),
      ModelConversational(
          lable: 'اسم ولي الامر', control: controle.parentsName),
      ModelConversational(
          lable: 'مستوي تعلیم الأب', control: controle.fathersEducationLevel),
      ModelConversational(
          lable: 'مستوى تعلیم الأم', control: controle.motherEducationLevel),
      ModelConversational(
          lable: 'عمل الأب', control: controle.fathersOccupation),
      ModelConversational(
          lable: 'عمل الأم', control: controle.mothersOccupation),
      ModelConversational(
          lable: 'عدد أفراد الاسرة', control: controle.numberOfFamilyMembers),
      ModelConversational(
          lable: 'ترتیب الطفل بین أخواتھ', control: controle.childsBirthOrder),
      ModelConversational(
          lable: 'ھل یوجد درجه القرابه بین الوالدین',
          control: controle.relationshipBetweenTheParents),
      ModelConversational(
          lable: 'مع من یقیم الطفل',
          control: controle.placeOfResidenceOfTheChild),
      ModelConversational(
          lable: 'المسؤول عن رعایة الطفل في المنزل',
          control: controle.childCareAtHome),
      ModelConversational(
          lable: 'ھل الطفل متكیف  في الاسرة',
          control: controle.childAdaptedToTheFamily),
      ModelConversational(
          lable: 'ھل توجد أمراض وراثیة في الأسرة',
          control: controle.hereditaryDiseases),
    ];
    listOfMedicalAndGeneticHistoryOfTheFamily = [
      ModelConversational(
          lable: 'ھل یوجد أي حالات مشابه أو أعاقات أخرى',
          control: controleMedical.controle1),
      ModelConversational(
          lable: 'ھل أجرى الأب والأم الصفوحات الجینیة',
          control: controleMedical.controle2),
      ModelConversational(
          lable: 'ھل یعتقد الأطباء الاضطراب ناتج عن عوامل وراثیة',
          control: controleMedical.controle3),
      ModelConversational(
          lable: 'عمر الأم عند الولادة', control: controleMedical.controle4),
      ModelConversational(
          lable: 'طول فتره الحمل', control: controleMedical.controle5),
      ModelConversational(
          lable: 'ھل عانت الأم من أي امراض قبل الحمل',
          control: controleMedical.controle6),
      ModelConversational(
          lable: 'ھل اصیبت الأم من أي أمراض اثناء الحمل',
          control: controleMedical.controle7),
      ModelConversational(
          lable: 'ھل عانت الأم من التعب والارھاق الحاد اثناء فترة الحمل',
          control: controleMedical.controle8),
    ];
    listOfChildMedicalAndMedicalHistory = [
      ModelConversational(
          lable: 'متى اكتشفت الأسرة الاضطراب',
          control: childMedicalAndMedicalHistory.controle1),
      ModelConversational(
          lable: 'ھل أصیب الطفل بأي أمراض حادة أو حوادث أثرت على تطوره ونموه',
          control: childMedicalAndMedicalHistory.controle2),
      ModelConversational(
          lable: 'ھل یعاني الطفل من مشكلات سمعیة',
          control: childMedicalAndMedicalHistory.controle3),
      ModelConversational(
          lable: 'ھل یعاني الطفل من مشكلات بصریة',
          control: childMedicalAndMedicalHistory.controle4),
      ModelConversational(
          lable: 'ھل یعاني الطفل من أي تشوھات خلقیھ',
          control: childMedicalAndMedicalHistory.controle5),
      ModelConversational(
          lable: 'ھل یعاني الطفل من مشكلات في تناول الطعام أو الشراب',
          control: childMedicalAndMedicalHistory.controle6),
      ModelConversational(
          lable: 'ھل یعاني الطفل من نوبات تشنجات',
          control: childMedicalAndMedicalHistory.controle7),
      ModelConversational(
          lable: 'ھل یعاني الطفل من الحساسیة لأدویھ أو أطعمھ معینه',
          control: childMedicalAndMedicalHistory.controle8),
      ModelConversational(
          lable: 'ھل أجري الطفل عملیات جراحیة',
          control: childMedicalAndMedicalHistory.controle9),
      ModelConversational(
          lable: 'ھل یتناول الطفل أدویھ أو عقاقیر حالیا',
          control: childMedicalAndMedicalHistory.controle10),
      ModelConversational(
          lable: 'ھل مازال الطفل یستخدم الحفاظ',
          control: childMedicalAndMedicalHistory.controle11),
    ];
    listOfChildDevelopmentalHistory = [
      ModelConversational(
          lable: 'مستوى النمو اللغوي الحالي',
          control: contolrChildDevelopmentalHistory.controle1),
      ModelConversational(
          lable: 'مستوى النمو الحركي الحالي',
          control: contolrChildDevelopmentalHistory.controle2),
      ModelConversational(
          lable: 'مستوى المھارات الوظیفیة الاستقلالیة الحالیة',
          control: contolrChildDevelopmentalHistory.controle3),
      ModelConversational(
          lable: 'مستوى المھارات الادراكیة والمعرفیة الحالیة',
          control: contolrChildDevelopmentalHistory.controle4),
      ModelConversational(
          lable: 'نشاط حركي زائد',
          control: contolrChildDevelopmentalHistory.controle5),
      ModelConversational(
          lable: 'تشتت انتباه والتركیز',
          control: contolrChildDevelopmentalHistory.controle6),
      ModelConversational(
          lable: 'سلوك عدواني',
          control: contolrChildDevelopmentalHistory.controle7),
      ModelConversational(
          lable: 'سلوك العناد',
          control: contolrChildDevelopmentalHistory.controle8),
      ModelConversational(
          lable: 'سلوكیات أخرى',
          control: contolrChildDevelopmentalHistory.controle9),
    ];
    listOfNoteConversation = [
      ModelConversational(
          lable: 'المعززات', control: controleNoteConversation.reinforcers),
      ModelConversational(
          lable: 'الاھداف المبدئیة',
          control: controleNoteConversation.initialGoals),
      ModelConversational(
          lable: 'ملاحظات', control: controleNoteConversation.note),
    ];
  }
}
