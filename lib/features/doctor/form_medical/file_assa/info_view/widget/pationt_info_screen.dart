import 'package:flutter/material.dart';
import '../../../model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';

class PatientInfoView extends StatelessWidget {
  const PatientInfoView({
    super.key,
    // required this.stepperControl,
    required this.personalHistory,
  });

  // final StepperControlPatientInfo stepperControl;
  final List<ModelPatientInfo> personalHistory;

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
                  child: Image.asset(AppImages.fileAssessment)),
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
              Column(
                children: List.generate(personalHistory.length, (index) {
                  return InfoRowItem(
                      title: personalHistory[index].question!,
                      value: personalHistory[index].answer ?? '');
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
