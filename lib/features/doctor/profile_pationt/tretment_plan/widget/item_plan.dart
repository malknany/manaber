import 'package:flutter/material.dart';

import '../../../../../shared/components/navigator.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/styles.dart';
import '../model.dart';
import 'data_view.dart';

class ItemPlan extends StatelessWidget {
  const ItemPlan({
    super.key,
    required this.modelTretmentPlan,
    required this.onDismissed,
  });
  final ModelTretmentPlan modelTretmentPlan;
  final Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            DataView(
              modelTretmentPlan: modelTretmentPlan,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Material(
          shadowColor: AppColors.primarycolor,
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.delete, color: Colors.white),
                  Text(
                    'حذف',
                    style: AppTextStyles.lrTitles
                        .copyWith(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            onDismissed: onDismissed,
            key: ValueKey<String>(modelTretmentPlan.id),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.sizeOf(context).height / 4,
              child: Center(
                child: Text(
                  modelTretmentPlan.name,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primarycolor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
