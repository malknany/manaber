import 'package:flutter/material.dart';
import 'package:manaber/features/sample.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class PersonalHistory extends StatefulWidget {
  const PersonalHistory(
      {super.key,
      required this.controleOccupation,
      required this.personalHistory});
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> personalHistory;

  @override
  State<PersonalHistory> createState() => _PersonalHistoryState();
}

class _PersonalHistoryState extends State<PersonalHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal History'),
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
                widget.controleOccupation.listOfPationHistory.length, (index) {
              var model = widget.controleOccupation.listOfPationHistory[index];
              if (model is ModelDropDownOccupation) {
                model.textEditingController.text =
                    widget.personalHistory[index].answer ?? model.itemList.first;
                return CustomDropdownButton2(
                  hint: model.lableName,
                  value: model.textEditingController.text,
                  dropdownItems: model.itemList,
                  onChanged: (value) {
                    setState(() {
                    widget.personalHistory[index].answer=value??"null";  
                    });
                    
                  },
                );
                // DropdownButtonItem(
                //   onChanged: (p0) {
                //     personalHistory[index].answer=p0??"null";
                //   },
                //   controller: model.textEditingController,
                //   labelName: model.lableName,
                //   itemList: model.itemList,
                // );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    onChanged: (p0) {
                      widget.personalHistory[index].answer = p0 ?? "null";
                    },
                    initialValue: widget.personalHistory[index].answer,
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }

              return const SizedBox.shrink();
            }),
          )),
    );
  }
}
