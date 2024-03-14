// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';

class BehaviorADLSView extends StatelessWidget {
  const BehaviorADLSView(
      {super.key,
      required this.behaviorADLS});
  final List<ModelPatientInfo> behaviorADLS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Behavior And ADLS',
          style: TextStyle(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.occupationalTherapy)),
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
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: behaviorADLS.length,
                  itemBuilder: (context, index) {
                    var model = behaviorADLS[index];
                    return InfoRowItem(
                      value: model.answer ?? "",
                      title: model.question!,
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == 4) {
                      return const DividerItem(
                        text: 'A.D.L.S',
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            )),
      ),
    );
  }
}
