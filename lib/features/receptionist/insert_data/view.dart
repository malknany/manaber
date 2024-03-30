import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/reception_cubit.dart';
import 'model.dart';
import 'controler.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

class ReceptionistDataEntry extends StatefulWidget {
  const ReceptionistDataEntry(
      {required this.controlReceptionist,
      super.key,
      required this.department});
  final String department;

  final StepperReceptionist controlReceptionist;

  @override
  State<ReceptionistDataEntry> createState() => _ReceptionistDataEntryState();
}

class _ReceptionistDataEntryState extends State<ReceptionistDataEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البیانات الأولیة'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    widget.controlReceptionist.lisOfModel.length, (index) {
                  final model = widget.controlReceptionist.lisOfModel[index];
                  if (model is TextFormFiledReception) {
                    return TextFormFiledStepper(
                        textDirection: TextDirection.rtl,
                        textEditingController: model.controller,
                        labelName: model.lable);
                  }
                  if (model is DropDownReception) {
                    return DropdownButtonItem(
                      alignment: Alignment.bottomRight,
                      textDirection: TextDirection.rtl,
                      labelName: model.label,
                      itemList: model.listOfItem!,
                      controller: model.controller,
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ),
              ButtonText(
                text: 'حفظ',
                onPressed: () {
                  print(widget.controlReceptionist.nameController.text);
                  print(widget.controlReceptionist.phoneNumberController.text);
                  final modelReception = ModelReceptiona(
                      name: widget.controlReceptionist.nameController.text,
                      phoneNumber: widget
                          .controlReceptionist.phoneNumberController.text,
                      gender: widget.controlReceptionist.genderController.text ==
                              'ذكر'
                          ? "MALE"
                          : "FEMALE",
                      department: widget.department,
                      consanguinity: widget
                          .controlReceptionist.consanguinityController.text,
                      cramps: widget.controlReceptionist.crampsController.text,
                      currentMedication: widget.controlReceptionist
                          .currentMedicationController.text,
                      geneAnalysis: widget
                          .controlReceptionist.geneAnalysisController.text,
                      geneProblem: widget
                          .controlReceptionist.geneProblemController.text,
                      otherProblems: widget
                          .controlReceptionist.otherProblemsController.text,
                      pregnancyProblem: widget
                          .controlReceptionist.pregnancyProblemController.text,
                      sameProblemInFamily: widget.controlReceptionist
                                  .sameProblemInFamilyController.text ==
                              'نعم'
                          ? true
                          : false,
                      vaccinations:
                          widget.controlReceptionist.vaccinationsController.text,
                      weigthAtBirth: widget.controlReceptionist.weigthAtBirthController.text);
                  context
                      .read<ReceptionCubit>()
                      .receptionPostData(modelReception);
                },
              ),
              BlocBuilder<ReceptionCubit, ReceptionState>(
                builder: (context, state) {
                  if (state is ReceptionLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  if (state is ReceptionSuccess) {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        itemSnackBar(context, 'تم رفع المعلومات',
                            AppColors.primaryColor);
                        Navigator.pop(context);
                      },
                    );
                    // WidgetsBinding.instance
                    //     .addPostFrameCallback((timeStamp) {});
                    return Center(
                      child: Text(
                        'تم رفع المعلومات ',
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.lrTitles.copyWith(
                            color: AppColors.primaryColor, fontSize: 15),
                      ),
                    );
                  }
                  if (state is ReceptionError) {
                    return Text(
                      state.msg,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.lrTitles
                          .copyWith(color: Colors.red, fontSize: 15),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.controlReceptionist.nameController.clear();
    widget.controlReceptionist.phoneNumberController.clear();
    widget.controlReceptionist.genderController.clear();
    widget.controlReceptionist.consanguinityController.clear();
    widget.controlReceptionist.crampsController.clear();
    widget.controlReceptionist.currentMedicationController.clear();
    widget.controlReceptionist.geneAnalysisController.clear();
    widget.controlReceptionist.geneProblemController.clear();
    widget.controlReceptionist.otherProblemsController.clear();
    widget.controlReceptionist.pregnancyProblemController.clear();
    widget.controlReceptionist.vaccinationsController.clear();
    widget.controlReceptionist.weigthAtBirthController.clear();
    super.dispose();
  }
}
