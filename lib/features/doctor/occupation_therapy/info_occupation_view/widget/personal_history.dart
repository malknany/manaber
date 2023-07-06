import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class PersonalHistoryView extends StatelessWidget {
  const PersonalHistoryView({super.key, required this.controlePersonalHistory});
  final StepperPersonalHistory controlePersonalHistory;

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
          'Patient Data',
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
                  "occupational",
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
                InfoRowItem(
                    title: "Patient name",
                    value: controlePersonalHistory.patientName.text),
                InfoRowItem(
                    title: "Diagnosis",
                    value: controlePersonalHistory.diagnosis.text),
                InfoRowItem(
                    title: "Frequency of treatment ",
                    value: controlePersonalHistory.frequencyOfTreatment.text),
                InfoRowItem(
                    title: "Age", value: controlePersonalHistory.age.text),
                InfoRowItem(
                    title: "Sex", value: controlePersonalHistory.sex.text),
                const DividerItem(text: 'medical history '),
                InfoRowItem(
                    title: 'Diseases',
                    value: controlePersonalHistory.diseases.text),
                InfoRowItem(
                    title: 'Surgery',
                    value: controlePersonalHistory.surgery.text),
              ],
            ),
          )),
    );
  }
}
