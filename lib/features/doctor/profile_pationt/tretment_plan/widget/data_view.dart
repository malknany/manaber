import 'package:flutter/material.dart';
import '../model.dart';
import '../../../../../shared/components/components.dart';

class DataView extends StatelessWidget {
  const DataView(
      {super.key,
      required this.modelTretmentPlan});
  // final TretmentPlanModel controle;

  final ModelTretmentPlan modelTretmentPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(modelTretmentPlan.name),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                children: List.generate(
              modelTretmentPlan.steps.length,
              (index) => InfoRowItem(
                  title: 'Step${index + 1}',
                  value: modelTretmentPlan.steps[index]),
            )),
          ),
        ),
      ),
    );
  }
}
