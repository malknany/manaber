import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class Rom extends StatelessWidget {
  const Rom({super.key, required this.controlBodyFunction});

  final StepperControlBodyFunction controlBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Rom'),
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
              DropdownButtonItem(
                controller: controlBodyFunction.hip,
                lableName: 'Hip',
                itemList: const [
                  'restricted',
                  'Normal',
                  'hyper',
                  'flexibility'
                ],
              ),
              DropdownButtonItem(
                  controller: controlBodyFunction.knee,
                  lableName: 'Knee',
                  itemList: const [
                    'restricted',
                    'Normal',
                    'hyper',
                    'flexibility'
                  ]),
              DropdownButtonItem(
                  controller: controlBodyFunction.ankle,
                  lableName: 'Ankle',
                  itemList: const [
                    'restricted',
                    'Normal',
                    'hyper',
                    'flexibility'
                  ]),
              DropdownButtonItem(
                  controller: controlBodyFunction.shoulder,
                  lableName: 'shoulder',
                  itemList: const [
                    'restricted',
                    'Normal',
                    'hyper',
                    'flexibility'
                  ]),
              DropdownButtonItem(
                  controller: controlBodyFunction.elbow,
                  lableName: 'elbow',
                  itemList: const [
                    'restricted',
                    'Normal',
                    'hyper',
                    'flexibility'
                  ]),
              TextFormFiledStepper(
                  labelname: 'Note',
                  textEditingController: controlBodyFunction.note),
            ],
          ),
        ),
      ),
    );
  }
}
