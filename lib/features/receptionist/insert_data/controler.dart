import 'package:flutter/material.dart';
import 'model.dart';

class StepperReceptionist {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final sameProblemInFamilyController = TextEditingController();
  final genderController = TextEditingController();
  final consanguinityController = TextEditingController();
  final crampsController = TextEditingController();
  final currentMedicationController = TextEditingController();
  final geneAnalysisController = TextEditingController();
  final geneProblemController = TextEditingController();
  final otherProblemsController = TextEditingController();
  final pregnancyProblemController = TextEditingController();
  final vaccinationsController = TextEditingController();
  final weigthAtBirthController = TextEditingController();
  List<ModelReception> lisOfModel = [];
  StepperReceptionist() {
    lisOfModel = [
      TextFormFiledReception(
        lable: 'الاسم',
        controller: nameController,
      ),
      TextFormFiledReception(
        lable: 'رقم الهاتف',
        controller: phoneNumberController,
      ),
      DropDowneReception(
        lable: 'الجنس',
        controller: genderController,
        listOfItem: ['ذكر', 'انثى'],
      ),
      TextFormFiledReception(
        lable: 'صلة القرابة بين الاب والام',
        controller: consanguinityController,
      ),
      TextFormFiledReception(
        lable: 'هل حدث مشكلة اثناء الولادة ؟ ماهي',
        controller: pregnancyProblemController,
      ),
      TextFormFiledReception(
        lable: 'كم وزن الطفل اثناء الولادة ؟',
        controller: weigthAtBirthController,
      ),
      TextFormFiledReception(
        lable: 'هل اخذ طفلك جميع التطعيمات؟',
        controller: vaccinationsController,
      ),
      TextFormFiledReception(
        lable: 'ماهي الادوية الحالية لطفلك ان وجدت',
        controller: currentMedicationController,
      ),
      TextFormFiledReception(
        lable: 'هل يعاني طفلك من أي نوع من انواع التشنجات',
        controller: crampsController,
      ),
      TextFormFiledReception(
        lable:
            'هل لدية مشاكل اخرى غير المشاكل الحركية (مثل مشاكل بالرئة او القلب)',
        controller: otherProblemsController,
      ),
      DropDowneReception(
        lable: 'هل يوجد اطفال يعانون من نفس المشكلة بالعائلة',
        controller: sameProblemInFamilyController,
        listOfItem: ['نعم', 'لا'],
      ),
      TextFormFiledReception(
        lable: 'هل اجريت لطفلك تحليل للجينات من قبل؟',
        controller: geneAnalysisController,
      ),
      TextFormFiledReception(
        lable: 'هل توجد مشكلة جينية من الاساس ام لا؟',
        controller: geneProblemController,
      ),
    ];
  }
}
