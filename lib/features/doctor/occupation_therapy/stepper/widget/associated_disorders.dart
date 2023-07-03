import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/occupation_therapy/stepper/controler.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class AssociatedDisorders extends StatelessWidget {
  const AssociatedDisorders(
      {super.key, required this.controlerAssociatedDisorders});
  final StepperAssociatedDisorders controlerAssociatedDisorders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Associated Disorders'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormFiledStepper(
                    labelname: 'Vision',
                    textEditingController: controlerAssociatedDisorders.vision),
                TextFormFiledStepper(
                    labelname: 'Hearing ',
                    textEditingController:
                        controlerAssociatedDisorders.hearing),
                TextFormFiledStepper(
                    labelname: 'Speech',
                    textEditingController: controlerAssociatedDisorders.speech),
                const DividerItem(text: 'Developmental milestone'),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.headControl,
                    lableName: 'Head control ',
                    itemList: const [
                      "can't do",
                      "can do",
                      "can do it with assistance"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.rolling,
                    lableName: 'Rolling  ',
                    itemList: const [
                      "can't do",
                      "can do",
                      "can do it with assistance"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.sitting,
                    lableName: 'Sitting  ',
                    itemList: const [
                      "can't do",
                      "can do",
                      "can do it with assistance"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.creeping,
                    lableName: 'Creeping Crayoning',
                    itemList: const [
                      "can't do",
                      "can do",
                      "can do it with assistance"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.standing,
                    lableName: 'Standing ',
                    itemList: const [
                      "can't do",
                      "can do",
                      "can do it with assistance"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.working,
                    lableName: 'Working ',
                    itemList: const [
                      "can't do",
                      "can do",
                      "can do it with assistance"
                    ]),
                const DividerItem(text: 'sensory skills'),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.tactile,
                    lableName: 'Tactile ',
                    itemList: const [
                      "Hypo  response",
                      "Hyper response ",
                      "Normal response"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.visual,
                    lableName: 'Visual ',
                    itemList: const [
                      "Hypo  response",
                      "Hyper response ",
                      "Normal response"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.auditory,
                    lableName: 'Auditory ',
                    itemList: const [
                      "Hypo  response",
                      "Hyper response ",
                      "Normal response"
                    ]),
                DropdownButtonItem(
                    controller: controlerAssociatedDisorders.vestibular,
                    lableName: 'Vestibular ',
                    itemList: const [
                      "Hypo  response",
                      "Hyper response ",
                      "Normal response"
                    ]),
              ],
            ),
          )),
    );
  }
}
