import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class PersonalHistory extends StatelessWidget {
  const PersonalHistory({super.key, required this.controlerPersonal});
  final StepperPersonalHistory controlerPersonal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal History'),
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
                    labelname: 'Patient name ',
                    textEditingController: controlerPersonal.patientName),
                TextFormFiledStepper(
                    labelname: 'Diagnosis',
                    textEditingController: controlerPersonal.diagnosis),
                TextFormFiledStepper(
                    labelname: 'Frequency of treatment',
                    textEditingController:
                        controlerPersonal.frequencyOfTreatment),
                TextFormFiledStepper(
                    textInputType: TextInputType.number,
                    labelname: 'Age',
                    textEditingController: controlerPersonal.age),
                DropdownButtonItem(
                    controller: controlerPersonal.sex,
                    lableName: 'Sex',
                    itemList: const ['Male', 'Femal']),
                TextFormFiledStepper(
                    labelname: 'Diseases',
                    textEditingController: controlerPersonal.diseases),
                TextFormFiledStepper(
                    labelname: 'Surgery',
                    textEditingController: controlerPersonal.surgery),
              ],
            ),
          )),
    );
  }
}
