import 'package:flutter/material.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../controler.dart';

class ChildMedicalAndMedicalHistory extends StatelessWidget {
  const ChildMedicalAndMedicalHistory(
      {super.key,
      required this.controlConversational,
      required this.childMedicalAndMedicalHistory});
  final ControlConversational controlConversational;
  final List<ModelPatientInfo> childMedicalAndMedicalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التاریخ الصحي والمرضي للطفل'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.builder(
            itemCount: controlConversational
                .listOfChildMedicalAndMedicalHistory.length,
            itemBuilder: (context, index) {
              return TextFormFiledStepper(
                hintText: childMedicalAndMedicalHistory[index].answer,
                textDirection: TextDirection.rtl,
                textEditingController: controlConversational
                    .listOfChildMedicalAndMedicalHistory[index].control,
                labelName: childMedicalAndMedicalHistory[index].question!,
              );
            },
          )),
    );
  }
}

/*
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
*/
