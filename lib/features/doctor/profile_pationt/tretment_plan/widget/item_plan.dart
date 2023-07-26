import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/model.dart';
import 'package:manaber/features/doctor/profile_pationt/tretment_plan/widget/data_view.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

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
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
