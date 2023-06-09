import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class PatientInformation extends StatelessWidget {
  PatientInformation({super.key});

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormFiledStepper(
                  labelname: 'Created by', textEditingController: controller1),
              TextFormFiledStepper(
                  labelname: 'Patient name ',
                  textEditingController: controller2),
              TextFormFiledStepper(
                labelname: 'Phone Number',
                textInputType: TextInputType.phone,
                textEditingController: controller3,
              ),
              TextFormFiledStepper(
                  labelname: 'Date of birthday',
                  textInputType: TextInputType.datetime,
                  textEditingController: controller1),
              DropdownButtonItem(
                  // textEditing: controller4,
                  lableName: 'Gender',
                  itemList: ['Male', 'Famale']),
              DropdownButtonItem(
                  // textEditing: controller4,
                  lableName: 'Consanguinity',
                  itemList: ['Yes', 'No']),
              TextFormFiledStepper(
                  labelname: 'Pregnancy Problem',
                  textEditingController: controller1),
              TextFormFiledStepper(
                  labelname: 'Birth Weight',
                  textEditingController: controller1),
              TextFormFiledStepper(
                  labelname: 'Incubation', textEditingController: controller1),
              DropdownButtonItem(
                  lableName: 'Vaccination', itemList: ['Yes', 'No']),
              TextFormFiledStepper(
                  labelname: 'Current Medications',
                  textEditingController: controller1),
              TextFormFiledStepper(
                labelname: 'Previous Medications',
                textEditingController: controller1,
              ),
              DropdownButtonItem(lableName: 'Convulsions', itemList: [
                'No',
                'With history',
                'Controlled',
                'Uncontrolled'
              ]),
              TextFormFiledStepper(
                  labelname: 'Convulsions', textEditingController: controller1),
              TextFormFiledStepper(
                labelname: 'Assistive Devices',
                textEditingController: controller1,
              ),
              TextFormFiledStepper(
                labelname: 'Other Associated Problems',
                textEditingController: controller1,
              ),
              TextFormFiledStepper(
                labelname: 'Similar cases in the family',
                textEditingController: controller1,
              ),
              TextFormFiledStepper(
                labelname: 'Investigations',
                textEditingController: controller1,
              ),
              TextFormFiledStepper(
                labelname: 'Diagnosis',
                textEditingController: controller1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
