import 'package:flutter/material.dart';

import '../../../../../shared/components/navigator.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/styles.dart';
import '../model.dart';
import 'data_view.dart';

class ItemLastReassessment extends StatelessWidget {
  const ItemLastReassessment({
    super.key,
    required this.modelLastReassessment,
    // required this.onDismissed,
  });
  final ModelLastReassessment modelLastReassessment;
  // final Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            LastReassessmentDataView(
              modelLastReassessment: modelLastReassessment,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Material(
          shadowColor: AppColors.primarycolor,
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.sizeOf(context).height / 4,
            child: Center(
              child: Text(
                modelLastReassessment.name,
                style: AppTextStyles.lrTitles
                    .copyWith(color: AppColors.primarycolor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
