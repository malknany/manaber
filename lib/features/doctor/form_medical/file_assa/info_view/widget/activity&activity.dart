// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class ActivityAndActivityLimitationView extends StatelessWidget {
  const ActivityAndActivityLimitationView({super.key, required this.activity});

  final List<ModelPatientInfo> activity;

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
                    activity.length,
                    (index) => InfoRowItem(
                      title: activity[index].question!,
                      value: activity[index].answer ?? '',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
