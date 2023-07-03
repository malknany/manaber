import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class BehaviorADLSView extends StatelessWidget {
  const BehaviorADLSView({super.key, required this.controleBehaviorADLS});
  final StepperBehaviorADLS controleBehaviorADLS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primarycolor,
        elevation: 0,
        child: const Icon(Icons.edit_outlined),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Behavior And ADLS',
          style: TextStyle(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.occupational)),
                const Text(
                  "occupational",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "All information about Patient",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16.0),
                const DividerItem(text: 'Behavior '),
                InfoRowItem(
                    title: "Aggression",
                    value: controleBehaviorADLS.aggression.text),
                InfoRowItem(
                    title: "Hyper activity",
                    value: controleBehaviorADLS.hyperActivity.text),
                InfoRowItem(
                    title: "Follow instructions",
                    value: controleBehaviorADLS.hyperActivity.text),
                InfoRowItem(
                    title: "Instruction with other children",
                    value:
                        controleBehaviorADLS.instructionWithOtherChildren.text),
                const DividerItem(text: 'A.D.L.S '),
                InfoRowItem(
                    title: "Feeding", value: controleBehaviorADLS.feeding.text),
                InfoRowItem(
                    title: "Brushing teeth",
                    value: controleBehaviorADLS.brushingTeeth.text),
                InfoRowItem(
                    title: "Dressing",
                    value: controleBehaviorADLS.dressing.text),
                InfoRowItem(
                    title: "Toilet", value: controleBehaviorADLS.toilet.text),
              ],
            ),
          )),
    );
  }
}
