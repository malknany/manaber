import 'package:flutter/material.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../model.dart';

class PatientInfoView extends StatelessWidget {
  const PatientInfoView({
    super.key,
    required this.personalHistory,
  });

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
      body: Scrollbar(
        interactive: true,
        radius: const Radius.circular(20),
        thickness: 10,
        child: Padding(
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
      ),
    );
  }
}
