import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class AssociatedDisordersView extends StatelessWidget {
  const AssociatedDisordersView({super.key,required this.controleAssociatedDisorders});
  final StepperAssociatedDisorders controleAssociatedDisorders;

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
          'Associated Disorders',
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
                const DividerItem(text: 'Associated disorders'),
                InfoRowItem(
                    title: "Vision",
                    value: controleAssociatedDisorders.vision.text),
                InfoRowItem(
                    title: "Hearing",
                    value: controleAssociatedDisorders.hearing.text),
                InfoRowItem(
                    title: "Speech",
                    value: controleAssociatedDisorders.speech.text),
                const DividerItem(text: 'Developmental milestone'),
                InfoRowItem(
                    title: "Head control ",
                    value: controleAssociatedDisorders.headControl.text),
                InfoRowItem(
                    title: "Rolling",
                    value: controleAssociatedDisorders.rolling.text),
                InfoRowItem(
                    title: "Sitting",
                    value: controleAssociatedDisorders.sitting.text),
                InfoRowItem(
                    title: "Creeping",
                    value: controleAssociatedDisorders.creeping.text),
                InfoRowItem(
                    title: "Crayoning",
                    value: controleAssociatedDisorders.creeping.text),
                InfoRowItem(
                    title: "Standing",
                    value: controleAssociatedDisorders.standing.text),
                InfoRowItem(
                    title: "Working",
                    value: controleAssociatedDisorders.working.text),
                const DividerItem(text: 'Sensory skills'),
                InfoRowItem(
                    title: "Tactile",
                    value: controleAssociatedDisorders.tactile.text),
                InfoRowItem(
                    title: "Visual",
                    value: controleAssociatedDisorders.visual.text),
                InfoRowItem(
                    title: "Auditory",
                    value: controleAssociatedDisorders.auditory.text),
                InfoRowItem(
                    title: "Vestibular",
                    value: controleAssociatedDisorders.vestibular.text),
              ],
            ),
          )),
    );
  }
}
