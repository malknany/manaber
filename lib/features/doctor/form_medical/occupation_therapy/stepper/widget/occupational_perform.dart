import 'package:flutter/material.dart';
import 'package:manaber/features/sample.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class OccupationalPerformance extends StatefulWidget {
  const OccupationalPerformance(
      {super.key,
      required this.controleOccupation,
      required this.occupationalPerformance});
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> occupationalPerformance;

  @override
  State<OccupationalPerformance> createState() => _OccupationalPerformanceState();
}

class _OccupationalPerformanceState extends State<OccupationalPerformance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Occupational Performance'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: ListView(
            addAutomaticKeepAlives: true,
            children: List.generate(
                widget.controleOccupation.listOfOccupationPreformance.length - 1,
                (index) {
              var model = widget.controleOccupation.listOfOccupationPreformance[index];
              if (model is ModelDropDownOccupation) {
                model.textEditingController.text =widget.occupationalPerformance[index].answer??model.itemList.first;
                return 
                CustomDropdownButton2(
                  hint: model.lableName,
                  value: model.textEditingController.text,
                  dropdownItems: model.itemList,
                  onChanged: (value) {
                    setState(() {
                    widget.occupationalPerformance[index].answer = value ?? "null";  
                    });
                    
                  },
                );
                // DropdownButtonItem(
                //   onChanged: (p0) {
                //     occupationalPerformance[index].answer= p0 ?? "null";
                //   },
                //   controller: model.textEditingController,
                //   labelName: model.lableName,
                //   itemList: model.itemList,
                // );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    onChanged: (p0) {
                      widget.occupationalPerformance[index].answer= p0 ?? "null";
                    },
                    initialValue: widget.occupationalPerformance[index].answer,
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }
              if (model is ModelDividerOccupation) {
                return DividerItem(text: model.text);
              }

              return const SizedBox.shrink();
            }),
          )),
    );
  }
}
