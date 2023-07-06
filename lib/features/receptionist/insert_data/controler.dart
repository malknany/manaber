import 'package:flutter/material.dart';
import 'package:manaber/features/receptionist/insert_data/model.dart';

class StepperReceptionist {
  TextEditingController controle1 = TextEditingController();
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
  List<ModelReception> lisOfModel = [];
  List<ModelReception> lisOfDropdown = [];
  StepperReceptionist() {
    lisOfDropdown = [
      ModelReception(
        lable: 'هل يوجد اطفال يعانون من نفس المشكلة بالعائلة',
        controller: controle9,
        listOfItem: ['نعم', 'لا'],
      ),
    ];
    lisOfModel = [
      ModelReception(
        lable: 'الاسم',
        controller: controle1,
      ),
      ModelReception(
        lable: 'صلة القرابة بين الاب والام',
        controller: controle2,
      ),
      ModelReception(
        lable: 'هل حدث مشكلة اثناء الولادة ؟ ماهي',
        controller: controle3,
      ),
      ModelReception(
        lable: 'كم وزن الطفل اثناء الولادة ؟',
        controller: controle4,
      ),
      ModelReception(
        lable: 'هل اخذ طفلك جميع التطعيمات؟',
        controller: controle5,
      ),
      ModelReception(
        lable: 'ماهي الادوية الحالية لطفلك ان وجدت',
        controller: controle6,
      ),
      ModelReception(
        lable: 'هل يعاني طفلك من أي نوع من انواع التشنجات',
        controller: controle7,
      ),
      ModelReception(
        lable:
            'هل لدية مشاكل اخرى غير المشاكل الحركية (مثل مشاكل بالرئة او القلب)',
        controller: controle8,
      ),
      ModelReception(
        lable: 'هل اجريت لطفلك تحليل للجينات من قبل؟',
        controller: controle10,
      ),
      ModelReception(
        lable: 'هل توجد مشكلة جينية من الاساس ام لا؟',
        controller: controle11,
      ),
    ];
  }
}
