// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation({
    super.key,
    required this.stepperControl,
  });
  final StepperControlPatientInfo stepperControl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: SingleChildScrollView(
          child: GestureDetector(
            // ! it is not work
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormFiledStepper(
                    labelname: 'Created by',
                    textEditingController: stepperControl.createdBy),
                TextFormFiledStepper(
                    labelname: 'Patient name ',
                    textEditingController: stepperControl.name),
                TextFormFiledStepper(
                  labelname: 'Phone Number',
                  textInputType: TextInputType.phone,
                  textEditingController: stepperControl.phone,
                ),
                TextFormFiledStepper(
                    labelname: 'Date of birthday',
                    textInputType: TextInputType.datetime,
                    textEditingController: stepperControl.dob),
                DropdownButtonItem(
                  controller: stepperControl.gender,
                  lableName: 'Gender',
                  itemList: const ['Male', 'Famale'],
                ),
                DropdownButtonItem(
                  controller: stepperControl.consanguinity,
                  lableName: 'Consanguinity',
                  itemList: const ['Yes', 'No'],
                ),
                TextFormFiledStepper(
                    labelname: 'Pregnancy Problem',
                    textEditingController: stepperControl.pregnancyProblem),
                TextFormFiledStepper(
                    labelname: 'Birth Weight',
                    textEditingController: stepperControl.birthWeight),
                TextFormFiledStepper(
                    labelname: 'Incubation',
                    textEditingController: stepperControl.incubation),
                DropdownButtonItem(
                    controller: stepperControl.vaccination,
                    lableName: 'Vaccination',
                    itemList: const ['Yes', 'No']),
                TextFormFiledStepper(
                    labelname: 'Current Medications',
                    textEditingController: stepperControl.currentMedications),
                TextFormFiledStepper(
                  labelname: 'Previous Medications',
                  textEditingController: stepperControl.previousMedications,
                ),
                DropdownButtonItem(
                    controller: stepperControl.convulsions,
                    lableName: 'Convulsions',
                    itemList: const [
                      'No',
                      'With history',
                      'Controlled',
                      'Uncontrolled'
                    ]),
                TextFormFiledStepper(
                  labelname: 'Assistive Devices',
                  textEditingController: stepperControl.assistiveDevices,
                ),
                TextFormFiledStepper(
                  labelname: 'Other Associated Problems',
                  textEditingController: stepperControl.otherAssociatedProblems,
                ),
                TextFormFiledStepper(
                  labelname: 'Similar cases in the family',
                  textEditingController: stepperControl.similarCasesInTheFamily,
                ),
                TextFormFiledStepper(
                  labelname: 'Investigations',
                  textEditingController: stepperControl.investigations,
                ),
                TextFormFiledStepper(
                  labelname: 'Diagnosis',
                  textEditingController: stepperControl.diagnosis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
