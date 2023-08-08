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
      {required this.controleReceptionist,
      super.key,
      required this.department});
  final String department;

  final StepperReceptionist controleReceptionist;

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
        foregroundColor: AppColors.primarycolor,
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
                    widget.controleReceptionist.lisOfModel.length, (index) {
                  final model = widget.controleReceptionist.lisOfModel[index];
                  if (model is TextFormFiledReception) {
                    return TextFormFiledStepper(
                        textDirection: TextDirection.rtl,
                        textEditingController: model.controller,
                        labelname: model.lable);
                  }
                  if (model is DropDowneReception) {
                    return DropdownButtonItem(
                      alignment: Alignment.bottomRight,
                      textDirection: TextDirection.rtl,
                      lableName: model.lable,
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
                  print(widget.controleReceptionist.nameController.text);
                  print(widget.controleReceptionist.phoneNumberController.text);
                  final modelReception = ModelReceptiona(
                      name: widget.controleReceptionist.nameController.text,
                      phoneNumber: widget
                          .controleReceptionist.phoneNumberController.text,
                      gender: widget.controleReceptionist.genderController.text ==
                              'ذكر'
                          ? "MALE"
                          : "FEMALE",
                      department: widget.department,
                      consanguinity: widget
                          .controleReceptionist.consanguinityController.text,
                      cramps: widget.controleReceptionist.crampsController.text,
                      currentMedication: widget.controleReceptionist
                          .currentMedicationController.text,
                      geneAnalysis: widget
                          .controleReceptionist.geneAnalysisController.text,
                      geneProblem: widget
                          .controleReceptionist.geneProblemController.text,
                      otherProblems: widget
                          .controleReceptionist.otherProblemsController.text,
                      pregnancyProblem: widget
                          .controleReceptionist.pregnancyProblemController.text,
                      sameProblemInFamily: widget.controleReceptionist
                                  .sameProblemInFamilyController.text ==
                              'نعم'
                          ? true
                          : false,
                      vaccinations:
                          widget.controleReceptionist.vaccinationsController.text,
                      weigthAtBirth: widget.controleReceptionist.weigthAtBirthController.text);
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
                        color: AppColors.primarycolor,
                      ),
                    );
                  }
                  if (state is ReceptionSuccess) {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        itemSnackBar(context, 'تم رفع المعلومات',
                            AppColors.primarycolor);
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
                            color: AppColors.primarycolor, fontSize: 15),
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
    widget.controleReceptionist.nameController.clear();
    widget.controleReceptionist.phoneNumberController.clear();
    widget.controleReceptionist.genderController.clear();
    widget.controleReceptionist.consanguinityController.clear();
    widget.controleReceptionist.crampsController.clear();
    widget.controleReceptionist.currentMedicationController.clear();
    widget.controleReceptionist.geneAnalysisController.clear();
    widget.controleReceptionist.geneProblemController.clear();
    widget.controleReceptionist.otherProblemsController.clear();
    widget.controleReceptionist.pregnancyProblemController.clear();
    widget.controleReceptionist.vaccinationsController.clear();
    widget.controleReceptionist.weigthAtBirthController.clear();
    super.dispose();
  }
}
