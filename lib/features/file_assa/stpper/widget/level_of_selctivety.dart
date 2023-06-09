import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class LevelofSelectivity  extends StatelessWidget {
  const LevelofSelectivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Level of Selectivity'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            DropdownButtonItem(lableName: 'Upper limb', itemList: [
              'No',
              'Poor',
              'Moderate',
              'Normal'
            ]),
            DropdownButtonItem(lableName: 'Lower limb ', itemList: [
              'No',
              'Poor',
              'Moderate',
              'Normal'
            ]),
            //! body of bottunsheet not fineshed
            ShowBottomSheetItems(
              name: ' Muscle Tone',
              contecnt: SizedBox(
                height: 500,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      DividerItem(text: 'Advanced Reflex'),
                      DropdownButtonItem(
                          lableName: 'Protective',
                          itemList: ['integrated', 'weak', 'Not integrated']),
                      DropdownButtonItem(
                          lableName: 'Righting and Equilibrium reflex	',
                          itemList: ['integrated', 'weak', 'Not integrated']),
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
