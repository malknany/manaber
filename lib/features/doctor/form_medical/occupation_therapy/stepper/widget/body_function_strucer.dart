import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class BodyFunctionStrucer extends StatefulWidget {
  const BodyFunctionStrucer(
      {super.key,
      required this.controleOccupation,
      required this.bodyFunctionStrucer});
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> bodyFunctionStrucer;

  @override
  State<BodyFunctionStrucer> createState() => _BodyFunctionStrucerState();
}

class _BodyFunctionStrucerState extends State<BodyFunctionStrucer>
    with AutomaticKeepAliveClientMixin<BodyFunctionStrucer> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Function Strucer'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView.builder(
            itemCount: widget.bodyFunctionStrucer.length,
            itemBuilder: (context, index) {
              var model =
                  widget.controleOccupation.listOfBodyFunctionStrucer[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  labelName: model.lableName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    // hintText: bodyFunctionStrucer[index].answer ?? '',
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }
              if (model is ModelDividerOccupation) {
                return DividerItem(text: model.text);
              }

              return const SizedBox.shrink();
            },
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
/*
const DividerItem(text: 'Neuromuscular Status'),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer
                        .neuromuscularStatusUpperLimb,
                    lableName: 'Upper limb',
                    itemList: const [
                      "Spastic",
                      "Flaccid",
                      "Normal",
                    ]),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer
                        .neuromuscularStatusLowerLimb,
                    lableName: 'Lower limb',
                    itemList: const [
                      "Spastic",
                      "Flaccid",
                      "Normal",
                    ]),
                TextFormFiledStepper(
                    labelname: 'Note',
                    textEditingController:
                        controlerBodyFunctionStrucer.neuromuscularStatusNote),
                const DividerItem(text: 'balance '),
                TextFormFiledStepper(
                    labelname: 'Sitting Balance Static',
                    textEditingController:
                        controlerBodyFunctionStrucer.sittingBalanceStatic),
                TextFormFiledStepper(
                    labelname: 'Sitting balance dynamic',
                    textEditingController:
                        controlerBodyFunctionStrucer.sittingBalanceDynamic),
                TextFormFiledStepper(
                    labelname: 'Posture',
                    textEditingController:
                        controlerBodyFunctionStrucer.posture),
                TextFormFiledStepper(
                    labelname: 'Gait ',
                    textEditingController: controlerBodyFunctionStrucer.gait),
                TextFormFiledStepper(
                    labelname: 'Deformities',
                    textEditingController:
                        controlerBodyFunctionStrucer.deformities),
                DropdownButtonItem(
                    controller: controlerBodyFunctionStrucer.musclebulk,
                    lableName: 'Muscle bulk',
                    itemList: const [
                      "Normal",
                      "atrophy",
                      "less than normal",
                      "speudo trophy"
                    ]),
                TextFormFiledStepper(
                    labelname: 'Leg Length Discrepancy ',
                    textEditingController:
                        controlerBodyFunctionStrucer.legLengthDiscrepancy),
                TextFormFiledStepper(
                    labelname: 'Skin Condition',
                    textEditingController:
                        controlerBodyFunctionStrucer.skinCondition),
                TextFormFiledStepper(
                    labelname: 'Assistive Devices',
                    textEditingController:
                        controlerBodyFunctionStrucer.assistiveDevices),
*/ 
