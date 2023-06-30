import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class NeurologicalExamination extends StatelessWidget {
  NeurologicalExamination({
    super.key,
  });
  final TextEditingController controller = TextEditingController();

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
        child: Column(
          children: [
            TextFormFiledStepper(
                labelname: 'Vision', textEditingController: controller),
            TextFormFiledStepper(
                labelname: 'Hearing', textEditingController: controller),
            TextFormFiledStepper(
              labelname: 'Invountary movement',
              textEditingController: controller,
            ),
            const ShowBottomSheetItems(
              name: 'Reflexes',
              contecnt: SizedBox(
                height: 900,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        DividerItem(text: 'Reflex'),
                        // DropdownButtonItem(
                        //     lableName: 'Palmar reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Planter reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Rooting reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Sucking reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Supine labyrinthine',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Prone labyrinthine',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Symmetrical tonic neck reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Asymmetrical tonic neck reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Foot-hand replacement',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Moro reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                        // DropdownButtonItem(
                        //     lableName: 'Landau reflex',
                        //     itemList: ['integrated', 'Not integrated']),
                      ],
                    )),
              ),
            ),
            const ShowBottomSheetItems(
              name: 'Advanced reflex',
              contecnt: SizedBox(
                height: 500,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      DividerItem(text: 'Advanced Reflex'),
                      // DropdownButtonItem(
                      //     lableName: 'Protective',
                      //     itemList: ['integrated', 'weak', 'Not integrated']),
                      // DropdownButtonItem(
                      //     lableName: 'Righting and Equilibrium reflex	',
                      //     itemList: ['integrated', 'weak', 'Not integrated']),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
