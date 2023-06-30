import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class PatientInformation extends StatelessWidget {
   PatientInformation({
    super.key,
    required this.stepperControl,
  });
  final StepperControl stepperControl;
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller1 = TextEditingController();

  final TextEditingController controller3 = TextEditingController();

  final TextEditingController controller4 = TextEditingController();

  final String slectedgender = '';

  final String slectedConsanguinity = '';

 final  String slectedVaccination = '';

  final String slectedConvulsions = '';

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
          child: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormFiledStepper(
                    labelname: 'Created by',
                    textEditingController: stepperControl.address),
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
                    textEditingController: stepperControl.years),
                DropdownButtonItem(
                  controller: controller1,
                  lableName: 'Gender',
                  itemList: const ['Male', 'Famale'],
                ),
                DropdownButtonItem(
                  controller: controller1,
                  lableName: 'Consanguinity',
                  itemList: const ['Yes', 'No'],
                ),
                TextFormFiledStepper(
                    labelname: 'Pregnancy Problem',
                    textEditingController: controller1),
                TextFormFiledStepper(
                    labelname: 'Birth Weight',
                    textEditingController: controller1),
                TextFormFiledStepper(
                    labelname: 'Incubation',
                    textEditingController: controller1),
                DropdownButtonItem(
                    controller: controller1,
                    lableName: 'Vaccination',
                    itemList: const ['Yes', 'No']),
                TextFormFiledStepper(
                    labelname: 'Current Medications',
                    textEditingController: controller1),
                TextFormFiledStepper(
                  labelname: 'Previous Medications',
                  textEditingController: controller1,
                ),
                DropdownButtonItem(
                    controller: controller1,
                    lableName: 'Convulsions',
                    itemList: const [
                      'No',
                      'With history',
                      'Controlled',
                      'Uncontrolled'
                    ]),
                TextFormFiledStepper(
                    labelname: 'Convulsions',
                    textEditingController: controller1),
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
      ),
    );
  }
}
