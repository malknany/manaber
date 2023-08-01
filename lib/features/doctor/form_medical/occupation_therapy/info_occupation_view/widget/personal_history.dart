import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/form_medical/occupation_therapy/stepper/model.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';
import '../../stepper/controler.dart';

class PersonalHistoryView extends StatelessWidget {
  const PersonalHistoryView({super.key, required this.controleOccupation});
  final ControleOccupation controleOccupation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Patient Data',
          style: TextStyle(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset(AppImages.occupationalTherapy)),
                const Text(
                  "occupational",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "All information about Patient",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controleOccupation.listOfPationHistory.length,
                  itemBuilder: (context, index) {
                    var model = controleOccupation.listOfPationHistory[index];
                    if (model is ModelDropDownOccupation) {
                      return InfoRowItem(
                        value: model.textEditingController.text,
                        title: model.lableName,
                      );
                    }
                    if (model is ModelTextFiledOccupation) {
                      return InfoRowItem(
                        value: model.textEditingController.text,
                        title: model.labelname,
                      );
                    }
                    if (model is ModelDividerOccupation) {
                      return DividerItem(
                        text: model.text,
                      );
                    }

                    return SizedBox.shrink();
                  },
                ),
              ],
            )),
      ),
    );
  }
}
