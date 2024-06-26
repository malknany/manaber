import 'package:flutter/material.dart';
import '../../../model.dart';
import '../model.dart';
import '../controller.dart';
import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';

class NeurologicalExamination extends StatelessWidget {
  const NeurologicalExamination(
      {super.key,
      required this.neurologicalExamination,
      required this.controlFileAssessment});
  final ControlFileAssessment controlFileAssessment;
  final List<ModelPatientInfo> neurologicalExamination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Neurological Examination'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controlFileAssessment.listNeurological.length,
                itemBuilder: (context, index) {
                  var model = controlFileAssessment.listNeurological[index];
                  if (model is DividerFileAssModel) {
                    return DividerItem(text: model.text);
                  }
                  if (model is DropdownButtonItemModel) {
                    return DropdownButtonItem(
                      controller: model.controller,
                      labelName: model.labelName,
                      itemList: model.itemList,
                    );
                  }
                  if (model is TextFormFiledStepperModel) {
                    return TextFormFiledStepper(
                        hintText: neurologicalExamination[index].answer,
                        labelName: model.labelName,
                        textEditingController: model.textEditingController);
                  }
                  if (model is BottomSheetFileAssModel) {
                    return ShowBottomSheetItems(
                      name: model.name,
                      content: SizedBox(
                        height: MediaQuery.sizeOf(context).height / 1.2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: model.itemList.length,
                                  itemBuilder: (context, idx) {
                                    final item = model.itemList[idx];
                                    if (item is TextFormFiledStepperModel) {
                                      return TextFormFiledStepper(
                                          hintText: neurologicalExamination[idx]
                                              .answer,
                                          labelName: item.labelName,
                                          textEditingController:
                                              item.textEditingController);
                                    }
                                    if (item is DropdownButtonItemModel) {
                                      return DropdownButtonItem(
                                        controller: item.controller,
                                        labelName: item.labelName,
                                        itemList: item.itemList,
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ),
                              ButtonText(
                                  text: 'Save',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}

// TextFormFiledStepper(
//     labelname: 'Vision',
//     textEditingController: controlBodyFunction.vision),
// TextFormFiledStepper(
//     labelname: 'Hearing',
//     textEditingController: controlBodyFunction.hearing),
// TextFormFiledStepper(
//   labelname: 'Invountary movement',
//   textEditingController: controlBodyFunction.involantaryMovment,
// ),
// ShowBottomSheetItems(
//   name: 'Primitive Reflexes',
//   contecnt: SizedBox(
//     height: MediaQuery.sizeOf(context).height / 1.3,
//     child: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 20, vertical: 20),
//         child: ListView(
//           children: [
//             const DividerItem(text: 'Reflex'),
//             DropdownButtonItem(
//                 controller: controlBodyFunction.palmarReflex,
//                 lableName: 'Palmar reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction.planterReflex,
//                 lableName: 'Planter reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction.rootingReflex,
//                 lableName: 'Rooting reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction.suckingReflex,
//                 lableName: 'Sucking reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller:
//                     controlBodyFunction.supineLabyrinthine,
//                 lableName: 'Supine labyrinthine',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction.proneLabyrinthine,
//                 lableName: 'Prone labyrinthine',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction
//                     .symmetricalTonicNeckReflex,
//                 lableName: 'Symmetrical tonic neck reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction
//                     .asymmetricalTonicNeckReflex,
//                 lableName: 'Asymmetrical tonic neck reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller:
//                     controlBodyFunction.footHandReplacement,
//                 lableName: 'Foot-hand replacement',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction.moroReflex,
//                 lableName: 'Moro reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             DropdownButtonItem(
//                 controller: controlBodyFunction.landauReflex,
//                 lableName: 'Landau reflex',
//                 itemList: const [
//                   'integrated',
//                   'Not integrated',
//                   'Not Tested'
//                 ]),
//             ButtonText(
//                 text: 'Save',
//                 onPressed: () {
//                   Navigator.pop(context);
//                 })
//           ],
//         )),
//   ),
// ),
// ShowBottomSheetItems(
//   name: 'Advanced reflex',
//   contecnt: SizedBox(
//     height: 500,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 20, vertical: 20),
//       child: Column(
//         children: [
//           const DividerItem(text: 'Advanced Reflex'),
//           DropdownButtonItem(
//               controller: controlBodyFunction.protective,
//               lableName: 'Protective',
//               itemList: const [
//                 'integrated',
//                 'weak',
//                 'Not integrated'
//               ]),
//           DropdownButtonItem(
//               controller: controlBodyFunction
//                   .rightingAndEquilibriumReflex,
//               lableName: 'Righting and Equilibrium reflex	',
//               itemList: const [
//                 'integrated',
//                 'weak',
//                 'Not integrated'
//               ]),
//           ButtonText(
//               text: 'Save',
//               onPressed: () {
//                 Navigator.pop(context);
//               })
//         ],
//       ),
//     ),
//   ),
// ),
