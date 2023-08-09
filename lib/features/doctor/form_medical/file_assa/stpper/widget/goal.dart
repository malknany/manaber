import 'package:flutter/material.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class Goals extends StatelessWidget {
  const Goals(
      {super.key,
      // required this.controlGoalsAndNote,
      required this.controleFileAssesment});

  // final StepperControlGoalsAndNote controlGoalsAndNote;
  final ControleFileAssesment controleFileAssesment;
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
                itemCount: controleFileAssesment.listGoal.length - 1,
                itemBuilder: (context, index) {
                  var model = controleFileAssesment.listGoal[index];
                  if (model is DividerFileAssModel) {
                    return DividerItem(text: model.text);
                  }
                  if (model is DropdownButtonItemModel) {
                    return DropdownButtonItem(
                      controller: model.controller,
                      labelName: model.labelName,
                      itemList: model.itemList,
                    );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
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
