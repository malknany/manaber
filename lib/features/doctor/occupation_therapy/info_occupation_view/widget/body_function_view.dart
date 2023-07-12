import 'package:flutter/material.dart';
import '../../stepper/controler.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/images.dart';

class BodyFunctionAndStrucerView extends StatelessWidget {
  const BodyFunctionAndStrucerView({super.key,required this.controleBodyFunctionStrucer});
  final StepperBodyFunctionStrucer controleBodyFunctionStrucer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.primarycolor,
      //   elevation: 0,
      //   child: const Icon(Icons.edit_outlined),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Body Function And Strucer',
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
                const DividerItem(text: 'Neuromuscular status'),
                RowItemRightLeft(
                    right: controleBodyFunctionStrucer.spasticUpperLimb.text,
                    left: controleBodyFunctionStrucer.spasticLowerLimb.text,
                    title: 'Spastic',
                    tilteRight: 'UpperLimb',
                    titleLeft: 'LowerLinb'),
                RowItemRightLeft(
                    right: controleBodyFunctionStrucer.flaccidUpperLimb.text,
                    left: controleBodyFunctionStrucer.flaccidLowerLimb.text,
                    title: 'Flaccid ',
                    tilteRight: 'UpperLimb',
                    titleLeft: 'LowerLinb'),
                RowItemRightLeft(
                    right: controleBodyFunctionStrucer.normalUpperLimb.text,
                    left: controleBodyFunctionStrucer.normalLowerLimb.text,
                    title: 'Normal ',
                    tilteRight: 'UpperLimb',
                    titleLeft: 'LowerLinb'),
                const DividerItem(text: 'Balance'),
                InfoRowItem(
                    title: "Sitting balance static",
                    value:
                        controleBodyFunctionStrucer.sittingBalanceStatic.text),
                InfoRowItem(
                    title: "Sitting balance dynamic",
                    value:
                        controleBodyFunctionStrucer.sittingBalanceDynamic.text),
                InfoRowItem(
                    title: "Posture",
                    value: controleBodyFunctionStrucer.posture.text),
                InfoRowItem(
                    title: "Gait",
                    value: controleBodyFunctionStrucer.gait.text),
                InfoRowItem(
                    title: "Deformities",
                    value: controleBodyFunctionStrucer.deformities.text),
                InfoRowItem(
                    title: "Muscle bulk",
                    value: controleBodyFunctionStrucer.musclebulk.text),
                InfoRowItem(
                    title: "Leg length discrepancy",
                    value:
                        controleBodyFunctionStrucer.legLengthDiscrepancy.text),
                InfoRowItem(
                    title: "Skin condition",
                    value: controleBodyFunctionStrucer.skinCondition.text),
                InfoRowItem(
                    title: "Assistive devices",
                    value: controleBodyFunctionStrucer.assistiveDevices.text),
              ],
            ),
          )),
    );
  }
}
