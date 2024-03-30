import 'package:flutter/material.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

import '../controler.dart';

class ChildDevelopmentalHistory extends StatelessWidget {
  const ChildDevelopmentalHistory(
      {super.key,
      required this.controlConversational,
      required this.childDevelopmentalHistory});
  final ControlConversational controlConversational;
  final List<ModelPatientInfo> childDevelopmentalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تاریخ النمو التطوري للطفل'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TextFormFiledStepper(
                    hintText: childDevelopmentalHistory[index].answer,
                    textDirection: TextDirection.rtl,
                    textEditingController: controlConversational
                        .listOfChildDevelopmentalHistory[index].control,
                    labelName: childDevelopmentalHistory[index].question!);
              },
              separatorBuilder: (context, index) {
                if (index == 3) {
                  return const Column(
                    children: [
                      DividerItem(text: 'المشكلات السلوكیھ للطفل'),
                      Text('ھل یعاني الطفل من المشكلات السلوكیة التالیة')
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              itemCount: controlConversational
                  .listOfChildDevelopmentalHistory.length)),
    );
  }
}

/*
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
*/
