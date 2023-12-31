import 'package:flutter/material.dart';
import '../model.dart';
import '../../../../../shared/components/components.dart';

class LastReassessmentDataView extends StatelessWidget {
  const LastReassessmentDataView(
      {super.key,
      required this.modelLastReassessment});
  // final TretmentPlanModel controle;

  final ModelLastReassessment modelLastReassessment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(modelLastReassessment.name),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                children: List.generate(
              modelLastReassessment.steps.length,
              (index) => InfoRowItem(
                  title: 'Step${index + 1}',
                  value: modelLastReassessment.steps[index]),
            )),
          ),
        ),
      ),
    );
  }
}
