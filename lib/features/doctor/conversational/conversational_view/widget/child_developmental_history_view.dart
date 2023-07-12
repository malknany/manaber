import 'package:flutter/material.dart';
import '../../stepper/controler.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/images.dart';

class ChildDevelopmentalHistoryView extends StatelessWidget {
  const ChildDevelopmentalHistoryView(
      {super.key, required this.controleConversational});
  // final StepperChildDevelopmentalHistory controlechildDevelopmentalHistory;
  final ControleConversational controleConversational;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'تاریخ النمو التطوري للطفل',
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
                  child: Image.asset(AppImages.conversational)),
              const SizedBox(height: 16.0),
              Column(
                children: List.generate(
                    controleConversational
                        .listOfChildDevelopmentalHistory.length,
                    (index) => InfoRowItem(
                        textDirection: TextDirection.rtl,
                        title: controleConversational
                            .listOfChildDevelopmentalHistory[index].lable,
                        value: controleConversational
                            .listOfChildDevelopmentalHistory[index]
                            .controle
                            .text)),
              ),
            ],
          )),
    );
  }
}
/*
InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "مستوى النمو اللغوي الحالي",
                  value: controlechildDevelopmentalHistory.controle1.text),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "مستوى النمو الحركي الحالي",
                  value: controlechildDevelopmentalHistory.controle2.text),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "مستوى المھارات الوظیفیة الاستقلالیة الحالیة",
                  value: controlechildDevelopmentalHistory.controle3.text),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "مستوى المھارات الادراكیة والمعرفیة الحالیة",
                  value: controlechildDevelopmentalHistory.controle4.text),
              const Text('المشكلات السلوكیھ للطفل'),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "نشاط حركي زائد",
                  value: controlechildDevelopmentalHistory.controle5.text),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "تشتت انتباه والتركیز ",
                  value: controlechildDevelopmentalHistory.controle6.text),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "سلوك عدواني",
                  value: controlechildDevelopmentalHistory.controle7.text),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "سلوك العناد",
                  value: controlechildDevelopmentalHistory.controle8.text),
              InfoRowItem(
                  textDirection: TextDirection.rtl,
                  title: "سلوكیات أخرى",
                  value: controlechildDevelopmentalHistory.controle9.text),
*/ 