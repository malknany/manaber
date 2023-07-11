import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/conversational/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class ChildDevelopmentalHistoryView extends StatelessWidget {
  const ChildDevelopmentalHistoryView(
      {super.key, required this.controlechildDevelopmentalHistory});
  final StepperChildDevelopmentalHistory controlechildDevelopmentalHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.primarycolor,
      //   elevation: 0,
      //   child: const Icon(Icons.edit_outlined),
      // ),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.conversational)),
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
              ],
            ),
          )),
    );
  }
}
