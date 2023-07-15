import 'package:flutter/material.dart';
import 'package:manaber/shared/styles/styles.dart';
import '../../stepper/controler.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/images.dart';

class ChildMedicalAndMedicalHistoryView extends StatelessWidget {
  const ChildMedicalAndMedicalHistoryView(
      {super.key, required this.controleConversational});
  final ControleConversational controleConversational;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: List.generate(
                    controleConversational
                        .listOfChildMedicalAndMedicalHistory.length,
                    (index) => InfoRowItem(
                        textDirection: TextDirection.rtl,
                        title: controleConversational
                            .listOfChildMedicalAndMedicalHistory[index].lable,
                        value: controleConversational
                            .listOfChildMedicalAndMedicalHistory[index]
                            .controle
                            .text)),
              ),
              //
            ],
          )),
    );
  }
}

/*
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
*/
