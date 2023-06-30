// ignore: file_names
import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class ICFBodyfunctionAndstructure extends StatefulWidget {
  const ICFBodyfunctionAndstructure({super.key});

  @override
  State<ICFBodyfunctionAndstructure> createState() =>
      _ICFBodyfunctionAndstructureState();
}

class _ICFBodyfunctionAndstructureState
    extends State<ICFBodyfunctionAndstructure> {
  final TextEditingController contolr = TextEditingController();

  final TextEditingController contolr1 = TextEditingController();

  String slectedMentalStatus = '';
  String slectedFunctionOfMetabolicAndEndocrine = '';

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
                  controller: contolr,
                  lableName: 'Mental status',
                  itemList: const ['Normal', 'Less than nomal', 'Mental retarted']),
              TextFormFiledStepper(
                  labelname: 'Voice Speech ', textEditingController: contolr),
               DropdownButtonItem(
                controller: contolr,
                  lableName: 'Function of metabolic and endocrine',
                  itemList: const ['Normal', 'Less than nomal', 'Malnutrition']),
              TextFormFiledStepper(
                  labelname: 'Function of Cardiovascular ',
                  textEditingController: contolr),
              const DividerItem(text: 'Sensory Examination'),
              TextFormFiledStepper(
                  labelname: 'Superficial', textEditingController: contolr),
              TextFormFiledStepper(
                  labelname: 'Vestibular', textEditingController: contolr),
              TextFormFiledStepper(
                  labelname: 'Proprioception', textEditingController: contolr),
              TextFormFiledStepper(
                  labelname: 'Tactile', textEditingController: contolr),
              const DividerItem(text: 'GaiT Problems '),
              TextFormFiledStepper(
                  labelname: 'Stance phase', textEditingController: contolr),
              TextFormFiledStepper(
                  labelname: 'Swing phase', textEditingController: contolr),
              const Divider(
                color: AppColors.grey,
                thickness: 2,
              ),
              TextFormFiledStepper(
                  labelname: 'Balance', textEditingController: contolr),
              ShowBottomSheetItems(
                name: 'Developmental Milestones',
                contecnt: SizedBox(
                  height: 900,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        TextFormFiledStepper(
                            labelname: 'Head control',
                            textEditingController: contolr),
                        TextFormFiledStepper(
                            labelname: 'Rolling',
                            textEditingController: contolr),
                        TextFormFiledStepper(
                            labelname: 'Creeping',
                            textEditingController: contolr),
                        TextFormFiledStepper(
                            labelname: 'Crawling',
                            textEditingController: contolr),
                        TextFormFiledStepper(
                            labelname: 'Sitting',
                            textEditingController: contolr),
                        TextFormFiledStepper(
                            labelname: 'Standing',
                            textEditingController: contolr),
                        TextFormFiledStepper(
                            labelname: 'Walking',
                            textEditingController: contolr),
                      ],
                    ),
                  ),
                ),
              ),
              TextFormFiledStepper(
                  labelname: 'Fine Motor Function (Hand Function) ',
                  textEditingController: contolr),
            ],
          ),
        ),
      ),
    );
  }
}
