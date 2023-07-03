import 'package:flutter/material.dart';

import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class ChildDevelopmentalHistory extends StatelessWidget {
  const ChildDevelopmentalHistory(
      {super.key, required this.controleChildDevelopmentalHistory});
  final StepperChildDevelopmentalHistory controleChildDevelopmentalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تاریخ النمو التطوري للطفل'),
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
              textDirection: TextDirection.rtl,
              children: [
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle1,
                    labelname: "مستوى النمو اللغوي الحالي",
                    textDirection: TextDirection.rtl),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle2,
                    labelname: "مستوى النمو الحركي الحالي",
                    textDirection: TextDirection.rtl),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle3,
                    labelname: "مستوى المھارات الوظیفیة الاستقلالیة الحالیة",
                    textDirection: TextDirection.rtl),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle4,
                    labelname: "مستوى المھارات الادراكیة والمعرفیة الحالیة",
                    textDirection: TextDirection.rtl),
                const DividerItem(text: 'المشكلات السلوكیھ للطفل'),
                const Text('ھل یعاني الطفل من المشكلات السلوكیة التالیة'),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle5,
                    labelname: "نشاط حركي زائد",
                    textDirection: TextDirection.rtl),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle6,
                    labelname: "تشتت انتباه والتركیز",
                    textDirection: TextDirection.rtl),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle7,
                    labelname: "سلوك عدواني",
                    textDirection: TextDirection.rtl),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle8,
                    labelname: "سلوك العناد",
                    textDirection: TextDirection.rtl),
                TextFormFiledStepper(
                    textEditingController:
                        controleChildDevelopmentalHistory.controle9,
                    labelname: "سلوكیات أخرى",
                    textDirection: TextDirection.rtl),
              ],
            ),
          )),
    );
  }
}
