import 'package:flutter/material.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class Note extends StatelessWidget {
  const Note(
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
        title: const Text('Note'),
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  var model = controleFileAssesment.listGoal.last;
                  if (model is TextFormFiledStepperModel) {
                    return Column(
                      children: [
                        TextFormFiledStepper(
                            labelname: model.labelName,
                            textEditingController: model.textEditingController),
                        ButtonText(
                            text: 'Save',
                            onPressed: () {
                              Navigator.pop(context, 'refresh');
                            }),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),

            // Expanded(flex: 6, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
