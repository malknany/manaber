import 'package:flutter/material.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';
import '../../../model.dart';

class AssociatedDisordersView extends StatelessWidget {
  const AssociatedDisordersView(
      {super.key,
      required this.associatedDisorders});

  final List<ModelPatientInfo> associatedDisorders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Associated Disorders',
          style: TextStyle(
            color: AppColors.primaryColor,
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
                ListView.separated(
                  separatorBuilder: (context, index) {
                    if (index == 3) {
                      return const DividerItem(
                        text: 'Developmental milestone',
                      );
                    }
                    if (index == 10) {
                      return const DividerItem(
                        text: 'sensory skills',
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: associatedDisorders.length,
                  itemBuilder: (context, index) {
                    var model = associatedDisorders[index];
                    return InfoRowItem(
                      value: model.answer ?? '',
                      title: model.question!,
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
