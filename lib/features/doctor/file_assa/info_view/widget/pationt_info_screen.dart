import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class PatientInfoView extends StatelessWidget {
  const PatientInfoView({
    super.key,
    required this.stepperControl,
  });

  final StepperControlPatientInfo stepperControl;

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
                  title: "Created By", value: stepperControl.createdBy.text),
              InfoRowItem(
                  title: "Name",
                  value: stepperControl.name.text.isEmpty
                      ? 'Null'
                      : stepperControl.name.text),
              InfoRowItem(
                  title: "Phone Number", value: stepperControl.phone.text),
              InfoRowItem(title: "DOB", value: stepperControl.dob.text),
              InfoRowItem(
                  title: "Gender",
                  value: stepperControl.gender.text.isEmpty
                      ? 'Null'
                      : stepperControl.gender.text),
              InfoRowItem(
                  title: "Consanguinity",
                  value: stepperControl.consanguinity.text),
              InfoRowItem(
                  title: "Pregnancy Problem",
                  value: stepperControl.pregnancyProblem.text),
              InfoRowItem(
                  title: "Birth Weight",
                  value: stepperControl.birthWeight.text),
              InfoRowItem(
                  title: "Incubation", value: stepperControl.incubation.text),
              InfoRowItem(
                  title: "Vaccination", value: stepperControl.vaccination.text),
              InfoRowItem(
                  title: "Current Medications",
                  value: stepperControl.currentMedications.text),
              InfoRowItem(
                  title: "Previous Medications",
                  value: stepperControl.previousMedications.text),
              InfoRowItem(
                  title: "Convulsions", value: stepperControl.convulsions.text),
              InfoRowItem(
                  title: "Assistive Devices",
                  value: stepperControl.assistiveDevices.text),
              InfoRowItem(
                  //columnWidth: columnWidth,
                  title: "Other Associated Problems",
                  value: stepperControl.otherAssociatedProblems.text),
              InfoRowItem(
                  //columnWidth: columnWidth,
                  title: "Similar cases in the family",
                  value: stepperControl.similarCasesInTheFamily.text),
              InfoRowItem(
                  //columnWidth: columnWidth,
                  title: "Investigations",
                  value: stepperControl.investigations.text),
              InfoRowItem(
                  //columnWidth: columnWidth,
                  title: "Diagnosis",
                  value: stepperControl.diagnosis.text),
            ],
          ),
        ),
      ),
    );
  }
}
