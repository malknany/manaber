import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class ChildMedicalAndMedicalHistory extends StatelessWidget {
  const ChildMedicalAndMedicalHistory(
      {super.key, required this.controlerChildMedicalAndMedicalHistory});
  final StepperChildMedicalAndMedicalHistory
      controlerChildMedicalAndMedicalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التاریخ الصحي والمرضي للطفل'),
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
                    labelname: 'متى اكتشفت الأسرة الاضطراب',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle1),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname:
                        'ھل أصیب الطفل بأي أمراض حادة أو حوادث أثرت على تطوره ونموه ',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle2),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل یعاني الطفل من مشكلات سمعیة ',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle3),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل یعاني الطفل من مشكلات بصریة',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle4),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل یعاني الطفل من أي تشوھات خلقیھ ',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle5),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname:
                        'ھل یعاني الطفل من مشكلات في تناول الطعام أو الشراب',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle6),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname:
                        'ھل یعاني الطفل من الحساسیة لأدویھ أو أطعمھ معینه',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle7),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل یعاني الطفل من نوبات تشنجات',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle8),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل أجري الطفل عملیات جراحیة',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle9),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل یتناول الطفل أدویھ أو عقاقیر حالیا',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle10),
                TextFormFiledStepper(
                    textDirection: TextDirection.rtl,
                    labelname: 'ھل مازال الطفل یستخدم الحفاظ ',
                    textEditingController:
                        controlerChildMedicalAndMedicalHistory.controle11),
              ],
            ),
          )),
    );
  }
}
