import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class ChildMedicalAndMedicalHistoryView extends StatelessWidget {
  const ChildMedicalAndMedicalHistoryView(
      {super.key, required this.controleChildMedicalAndMedicalHistory});
  final StepperChildMedicalAndMedicalHistory
      controleChildMedicalAndMedicalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primarycolor,
        elevation: 0,
        child: const Icon(Icons.edit_outlined),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'التاریخ الصحي والمرضي للطفل',
          style: TextStyle(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.occupational)),
                const Text(
                  "دراسه الحاله",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "متى اكتشفت الأسرة الاضطراب",
                    value:
                        controleChildMedicalAndMedicalHistory.controle1.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title:
                        "ھل أصیب الطفل بأي أمراض حادة أو حوادث أثرت على تطوره ونموه؟",
                    value:
                        controleChildMedicalAndMedicalHistory.controle2.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یعاني الطفل من مشكلات سمعیة",
                    value:
                        controleChildMedicalAndMedicalHistory.controle3.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یعاني الطفل من مشكلات بصریة",
                    value:
                        controleChildMedicalAndMedicalHistory.controle4.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یعاني الطفل من أي تشوھات خلقیھ",
                    value:
                        controleChildMedicalAndMedicalHistory.controle5.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یعاني الطفل من مشكلات في تناول الطعام أو الشراب",
                    value:
                        controleChildMedicalAndMedicalHistory.controle6.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یعاني الطفل من الحساسیة لأدویھ أو أطعمھ معینھ",
                    value:
                        controleChildMedicalAndMedicalHistory.controle7.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یعاني الطفل من نوبات تشنجات",
                    value:
                        controleChildMedicalAndMedicalHistory.controle8.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل أجري الطفل عملیات جراحیة",
                    value:
                        controleChildMedicalAndMedicalHistory.controle9.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل یتناول الطفل أدویھ أو عقاقیر حالیاً",
                    value:
                        controleChildMedicalAndMedicalHistory.controle10.text),
                InfoRowItem(
                    textDirection: TextDirection.rtl,
                    title: "ھل مازال الطفل یستخدم الحفاظ ",
                    value:
                        controleChildMedicalAndMedicalHistory.controle11.text),
              ],
            ),
          )),
    );
  }
}
