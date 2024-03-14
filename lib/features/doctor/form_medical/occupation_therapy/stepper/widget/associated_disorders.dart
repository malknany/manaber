import 'package:flutter/material.dart';
import 'package:manaber/features/sample.dart';
import '../../../model.dart';
import '../model.dart';
import '../controler.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class AssociatedDisorders extends StatefulWidget {
  const AssociatedDisorders(
      {super.key,
      required this.controleOccupation,
      required this.associatedDisorders});
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> associatedDisorders;

  @override
  State<AssociatedDisorders> createState() => _AssociatedDisordersState();
}

class _AssociatedDisordersState extends State<AssociatedDisorders> {
  final List<String> listTitleSprated = [
    'Developmental milestone',
    'Sensory skills'
  ];

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
          child: ListView.separated(
            addAutomaticKeepAlives: true,
            separatorBuilder: (context, index) {
              if (index == 2) {
                return DividerItem(text: listTitleSprated[0]);
              }
              if (index == 9) {
                return DividerItem(text: listTitleSprated[1]);
              }

              return const SizedBox.shrink();
            },
            itemCount:
                widget.controleOccupation.listOfAssociatedDisorders.length,
            itemBuilder: (context, index) {
              print(widget.controleOccupation.listOfAssociatedDisorders.length);
              print(widget.associatedDisorders.length);
              var model =
                  widget.controleOccupation.listOfAssociatedDisorders[index];
              if (model is ModelDropDownOccupation) {
                model.textEditingController.text =
                    widget.associatedDisorders[index].answer ??
                        model.itemList.first;
                return CustomDropdownButton2(
                  hint: model.lableName,
                  value: model.textEditingController.text,
                  dropdownItems: model.itemList,
                  onChanged: (value) {
                    setState(() {
                      widget.associatedDisorders[index].answer =
                          value ?? "null";
                    });
                  },
                );
                // DropdownButtonItem(
                //   onChanged: (p0) {
                //     associatedDisorders[index].answer = p0 ?? "null";
                //   },
                //   controller: model.textEditingController,
                //   labelName: model.lableName,
                //   itemList: model.itemList,
                // );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    onChanged: (p0) {
                      widget.associatedDisorders[index].answer = p0 ?? "null";
                    },
                    initialValue: widget.associatedDisorders[index].answer,
                    textInputType: model.textInputType,
                    labelname: model.labelname,
                    textEditingController: model.textEditingController);
              }
              // if (model is ModelDividerOccupation) {
              //   return DividerItem(text: model.text);
              // }

              return const SizedBox.shrink();
            },
            // itemBuilder: List.generate(
            //   controleOccupation.listOfAssociatedDisorders.length,
            //   (index) {
            //     print(associatedDisorders.length);
            //     print(controleOccupation.listOfAssociatedDisorders.length);
            //     var model = controleOccupation.listOfAssociatedDisorders[index];
            //     if (model is ModelDropDownOccupation) {
            //       model.textEditingController.text =
            //           associatedDisorders[index].answer ?? model.itemList.first;
            //       return DropdownButtonItem(
            //         onChanged: (p0) {
            //           associatedDisorders[index].answer = p0 ?? "null";
            //         },
            //         controller: model.textEditingController,
            //         labelName: model.lableName,
            //         itemList: model.itemList,
            //       );
            //     }
            //     if (model is ModelTextFiledOccupation) {
            //       return TextFormFiledStepper(
            //           onChanged: (p0) {
            //             associatedDisorders[index].answer = p0 ?? "null";
            //           },
            //           initialValue: associatedDisorders[index].answer,
            //           textInputType: model.textInputType,
            //           labelname: model.labelname,
            //           textEditingController: model.textEditingController);
            //     }
            //     if (model is ModelDividerOccupation) {
            //       return DividerItem(text: model.text);
            //     }

            //     return const SizedBox.shrink();
            //   },
          ),
        ));
  }
}
