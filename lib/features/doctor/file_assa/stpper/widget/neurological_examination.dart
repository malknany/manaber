import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class NeurologicalExamination extends StatelessWidget {
  NeurologicalExamination({super.key, required this.controlBodyFunction});
  final TextEditingController controller = TextEditingController();
  final StepperControlBodyFunction controlBodyFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Neurological Examination'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormFiledStepper(
                  labelname: 'Vision',
                  textEditingController: controlBodyFunction.vision),
              TextFormFiledStepper(
                  labelname: 'Hearing',
                  textEditingController: controlBodyFunction.hearing),
              TextFormFiledStepper(
                labelname: 'Invountary movement',
                textEditingController: controlBodyFunction.involantaryMovment,
              ),
              ShowBottomSheetItems(
                name: 'Reflexes',
                contecnt: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.3,
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const DividerItem(text: 'Reflex'),
                            DropdownButtonItem(
                                controller: controlBodyFunction.palmarReflex,
                                lableName: 'Palmar reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller: controlBodyFunction.planterReflex,
                                lableName: 'Planter reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller: controlBodyFunction.rootingReflex,
                                lableName: 'Rooting reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller: controlBodyFunction.suckingReflex,
                                lableName: 'Sucking reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller:
                                    controlBodyFunction.supineLabyrinthine,
                                lableName: 'Supine labyrinthine',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller:
                                    controlBodyFunction.proneLabyrinthine,
                                lableName: 'Prone labyrinthine',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller: controlBodyFunction
                                    .symmetricalTonicNeckReflex,
                                lableName: 'Symmetrical tonic neck reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller: controlBodyFunction
                                    .asymmetricalTonicNeckReflex,
                                lableName: 'Asymmetrical tonic neck reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller:
                                    controlBodyFunction.footHandReplacement,
                                lableName: 'Foot-hand replacement',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller: controlBodyFunction.moroReflex,
                                lableName: 'Moro reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            DropdownButtonItem(
                                controller: controlBodyFunction.landauReflex,
                                lableName: 'Landau reflex',
                                itemList: const ['integrated', 'Not integrated']),
                            ButtonText(
                                text: 'Save',
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        ),
                      )),
                ),
              ),
              ShowBottomSheetItems(
                name: 'Advanced reflex',
                contecnt: SizedBox(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        const DividerItem(text: 'Advanced Reflex'),
                        DropdownButtonItem(
                            controller: controlBodyFunction.protective,
                            lableName: 'Protective',
                            itemList: const ['integrated', 'weak', 'Not integrated']),
                        DropdownButtonItem(
                            controller: controlBodyFunction
                                .rightingAndEquilibriumReflex,
                            lableName: 'Righting and Equilibrium reflex	',
                            itemList: const ['integrated', 'weak', 'Not integrated']),
                        ButtonText(
                            text: 'Save',
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
