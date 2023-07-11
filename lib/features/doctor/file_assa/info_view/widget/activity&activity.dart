import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class ActivityAndActivityLimitationView extends StatelessWidget {
  const ActivityAndActivityLimitationView(
      {super.key, required this.controlActivityAndActivityLimitation});

  final StepperControlActivityAndActivityLimitation
      controlActivityAndActivityLimitation;

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
                InfoRowItem(
                    title: 'Activity and Activity Limitation',
                    value: controlActivityAndActivityLimitation
                        .activityAndActivityLimitation.text),
                InfoRowItem(
                    title: 'Participation And Participation Restriction',
                    value: controlActivityAndActivityLimitation
                        .participationAndParticipationRestriction.text),
              ],
            ),
          ),
        ));
  }
}
