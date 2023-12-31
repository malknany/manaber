import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/members/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class DataIntryFromReception extends StatelessWidget {
  const DataIntryFromReception({super.key, required this.patientInfo});
  final Patient patientInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Patient Data',
            style: TextStyle(
              color: AppColors.primarycolor,
            )),
      ),
      body: Scrollbar(
        interactive: true,
        radius: const Radius.circular(20),
        thickness: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "File Assessment",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "All information about Patient",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16.0),
                InfoRowItem(value: patientInfo.name!, title: 'الاسم'),
                InfoRowItem(
                    value: patientInfo.phoneNumber!, title: 'رقم الهاتف'),
                InfoRowItem(value: patientInfo.gender!, title: 'الجنس'),
                InfoRowItem(
                    value: patientInfo.consanguinity!,
                    title: 'صلة القرابة بين الاب والام'),
                InfoRowItem(
                    value: patientInfo.pregnancyProblem!,
                    title: 'هل حدث مشكلة اثناء الولادة ؟ ماهي'),
                InfoRowItem(
                    value: patientInfo.weigthAtBirth!,
                    title: 'كم وزن الطفل اثناء الولادة ؟'),
                InfoRowItem(
                    value: patientInfo.vaccinations!,
                    title: 'هل اخذ طفلك جميع التطعيمات؟'),
                InfoRowItem(
                    value: patientInfo.currentMedication!,
                    title: 'ماهي الادوية الحالية لطفلك ان وجدت'),
                InfoRowItem(
                    value: patientInfo.cramps!,
                    title: 'هل يعاني طفلك من أي نوع من انواع التشنجات'),
                InfoRowItem(
                    value: patientInfo.geneProblem!,
                    title:
                        'هل لدية مشاكل اخرى غير المشاكل الحركية (مثل مشاكل بالرئة او القلب)'),
                InfoRowItem(
                    value: patientInfo.sameProblemInFamily.toString(),
                    title: 'هل يوجد اطفال يعانون من نفس المشكلة بالعائلة'),
                InfoRowItem(
                    value: patientInfo.geneAnalysis.toString(),
                    title: 'هل اجريت لطفلك تحليل للجينات من قبل؟'),
                InfoRowItem(
                    value: patientInfo.otherProblems!,
                    title: 'هل توجد مشكلة جينية من الاساس ام لا؟'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//       TextFormFiledReception(
//         lable:
//             'هل لدية مشاكل اخرى غير المشاكل الحركية (مثل مشاكل بالرئة او القلب)',
//         controller: otherProblemsController,
//       ),
//       DropDowneReception(
//         lable: 'هل يوجد اطفال يعانون من نفس المشكلة بالعائلة',
//         controller: sameProblemInFamilyController,
//         listOfItem: ['نعم', 'لا'],
//       ),
//       TextFormFiledReception(
//         lable: 'هل اجريت لطفلك تحليل للجينات من قبل؟',
//         controller: geneAnalysisController,
//       ),
//       TextFormFiledReception(
//         lable: 'هل توجد مشكلة جينية من الاساس ام لا؟',
//         controller: geneProblemController,
//       ),