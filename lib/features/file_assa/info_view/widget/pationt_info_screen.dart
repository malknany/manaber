import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class PatientInfoView extends StatelessWidget {
  const PatientInfoView({
    super.key,
    required this.stepperControl,
  });

  final StepperControl stepperControl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primarycolor,
        elevation: 0,
        child: const Icon(Icons.edit_outlined),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Patient Data',
            style: TextStyle(
              color: AppColors.primarycolor,
            )),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final double columnWidth = maxWidth < 600 ? maxWidth : maxWidth / 2;
          return Padding(
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
                      columnWidth: columnWidth,
                      title: "Created By",
                      value: stepperControl.address.text),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Name",
                      value: stepperControl.name.text.isEmpty
                          ? 'Null'
                          : stepperControl.name.text),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Phone Number",
                      value: stepperControl.phone.text),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "DOB",
                      value: '10/20/2011'),
                  InfoRowItem(
                      columnWidth: columnWidth, title: "Gender", value: 'Male'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Consanguinity",
                      value: 'yes'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Pregnancy Problem",
                      value:
                          'fsadnfajsnfknvkjasnfjkdasnfkjasnfdkjasnfdkljanskjfnaskjfajkslbfkasdjbfkjasb'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Birth Weight",
                      value: 'dkjasnfdkljanskjfnaskjfajkslbfkasdjbfkjasbf*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Incubation",
                      value: 'kslbfkasdjbfkjasbf*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Birth Weight",
                      value: 'dkjasnfdkljanskjfnaskjfajkslbfkasdjbfkjasbf*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Vaccination",
                      value: 'fsadnfajsnfknvkj--*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Current Medications",
                      value: 'dkjasnfdkl*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Previous Medications",
                      value: 'dkjasnfdkl*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Convulsions",
                      value: 'dkjasnfdkl*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Assistive Devices",
                      value: 'dkjasnfdkl*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Other Associated Problems",
                      value: 'dkjasnfdkl*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Similar cases in the family",
                      value: 'dkjasnfdkl*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Investigations",
                      value: 'dkjasnfdkl*'),
                  InfoRowItem(
                      columnWidth: columnWidth,
                      title: "Diagnosis",
                      value: 'dkjasnfdkl*'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
