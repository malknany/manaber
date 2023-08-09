import 'package:flutter/material.dart';
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
  // final StepperOccupationPreformance controlerOccupationPreformance;
  final ControleOccupation controleOccupation;
  final List<ModelPatientInfo> occupationalPerformance;

  @override
  State<OccupationalPerformance> createState() =>
      _OccupationalPerformanceState();
}

class _OccupationalPerformanceState extends State<OccupationalPerformance>
    with AutomaticKeepAliveClientMixin<OccupationalPerformance> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          child: ListView.builder(
            itemCount:
                widget.controleOccupation.listOfOccupationPreformance.length -
                    1,
            itemBuilder: (context, index) {
              var model =
                  widget.controleOccupation.listOfOccupationPreformance[index];
              if (model is ModelDropDownOccupation) {
                return DropdownButtonItem(
                  controller: model.textEditingController,
                  labelName: model.lableName,
                  itemList: model.itemList,
                );
              }
              if (model is ModelTextFiledOccupation) {
                return TextFormFiledStepper(
                    hintText:
                        widget.occupationalPerformance[index].answer ?? '',
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
