// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class ICFBodyfunctionAndstructure extends StatelessWidget {
  const ICFBodyfunctionAndstructure(
      {super.key, required this.controlBodyFunction});

  final StepperControlBodyFunction controlBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ICF Body function And Structure'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButtonItem(
                  controller: controlBodyFunction.mentalStatus,
                  lableName: 'Mental status',
                  itemList: const [
                    'Normal',
                    'Less than nomal',
                    'Mental retarted'
                  ]),
              TextFormFiledStepper(
                  labelname: 'Voice Speech',
                  textEditingController: controlBodyFunction.voiceSpeech),
              DropdownButtonItem(
                  controller:
                      controlBodyFunction.functionOfMetabolicAndEndocrine,
                  lableName: 'Function of metabolic and endocrine',
                  itemList: const [
                    'Normal',
                    'Less than nomal',
                    'Malnutrition',
                    'Obese'
                  ]),
              TextFormFiledStepper(
                  labelname: 'Function of Cardiovascular ',
                  textEditingController:
                      controlBodyFunction.functionOfCardiovascularRespiration),
              const DividerItem(text: 'Sensory Examination'),
              TextFormFiledStepper(
                  labelname: 'Superficial',
                  textEditingController: controlBodyFunction.superficial),
              TextFormFiledStepper(
                  labelname: 'Vestibular',
                  textEditingController: controlBodyFunction.vestibular),
              TextFormFiledStepper(
                  labelname: 'Proprioception',
                  textEditingController: controlBodyFunction.proprioception),
              TextFormFiledStepper(
                  labelname: 'Tactile',
                  textEditingController: controlBodyFunction.tactile),
              const DividerItem(text: 'GaiT Problems '),
              TextFormFiledStepper(
                  labelname: 'Note',
                  textEditingController: controlBodyFunction.gaitnote),
              TextFormFiledStepper(
                  labelname: 'Stance phase',
                  textEditingController: controlBodyFunction.stancePhase),
              TextFormFiledStepper(
                  labelname: 'Swing phase',
                  textEditingController: controlBodyFunction.swingPhase),
              const Divider(
                color: AppColors.grey,
                thickness: 2,
              ),
              TextFormFiledStepper(
                  labelname: 'Balance',
                  textEditingController: controlBodyFunction.balance),
              ShowBottomSheetItems(
                name: 'Developmental Milestones',
                contecnt: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListView(
                      children: [
                        TextFormFiledStepper(
                            labelname: 'Head control',
                            textEditingController:
                                controlBodyFunction.headControl),
                        TextFormFiledStepper(
                            labelname: 'Rolling',
                            textEditingController: controlBodyFunction.rolling),
                        TextFormFiledStepper(
                            labelname: 'Creeping',
                            textEditingController:
                                controlBodyFunction.creeping),
                        TextFormFiledStepper(
                            labelname: 'Crawling',
                            textEditingController:
                                controlBodyFunction.crawling),
                        TextFormFiledStepper(
                            labelname: 'Sitting',
                            textEditingController: controlBodyFunction.sitting),
                        TextFormFiledStepper(
                            labelname: 'Standing',
                            textEditingController:
                                controlBodyFunction.standing),
                        TextFormFiledStepper(
                            labelname: 'Walking',
                            textEditingController: controlBodyFunction.walking),
                        ButtonText(
                            text: 'Save',
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              TextFormFiledStepper(
                  labelname: 'Fine Motor Function (Hand Function) ',
                  textEditingController:
                      controlBodyFunction.fineMotorFunctionHandFunction),
            ],
          ),
        ),
      ),
    );
  }
}
