import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key, required this.goals});
  final List<ModelPatientInfo> goals;

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
                  children: List.generate(
                    goals.length,
                    (index) => InfoRowItem(
                      title: goals[index].question!,
                      value: goals[index].answer ?? '',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
