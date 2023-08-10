// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/controller.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/model.dart';
import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation(
      {super.key,
      required this.patientInformation,
      required this.controleFileAssesment});
  // final StepperControlPatientInfo stepperControl;
  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> patientInformation;

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
        child: GestureDetector(
          // ! it is not work
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount:
                      controleFileAssesment.listPatientInfo.length,
                  itemBuilder: (context, index) {
                    var model =
                        controleFileAssesment.listPatientInfo[index];
                    if (model is DropdownButtonItemModel) {
                      return DropdownButtonItem(
                        controller: model.controller,
                        labelName: model.labelName,
                        itemList: model.itemList,
                      );
                    }
                    if (model is TextFormFiledStepperModel) {
                      return TextFormFiledStepper(
                          hintText: patientInformation[index].answer,
                          labelname: model.labelName,
                          textEditingController: model.textEditingController);
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
