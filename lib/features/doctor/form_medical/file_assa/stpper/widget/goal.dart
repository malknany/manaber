import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class Goals extends StatelessWidget {
  const Goals(
      {super.key, required this.goals, required this.controleFileAssesment});

  final ControleFileAssesment controleFileAssesment;
  final List<ModelPatientInfo> goals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Goals'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: controleFileAssesment.listGoal.length - 1,
                itemBuilder: (context, index) {
                  var model = controleFileAssesment.listGoal[index];
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        onChanged: (p0) {
                          goals[index].answer = p0 ?? "null";
                        },
                        initialValue: goals[index].answer,
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
    );
  }
}
