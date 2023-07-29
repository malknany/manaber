import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/video/model.dart';
import '../../../../../shared/components/constants.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/styles.dart';

class ItemCardVideo extends StatelessWidget {
  const ItemCardVideo({
    super.key,
    required this.name,
    required this.onDismissed,
    required this.onTap,
    required this.modelVideo,
  });
  final String name;

  final void Function()? onTap;
  final void Function(DismissDirection)? onDismissed;
  final ModelVideo modelVideo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
                  Text(
                    'حذف',
                    style: AppTextStyles.lrTitles
                        .copyWith(fontSize: 15, color: Colors.white),
                  ),
                  const Icon(Icons.delete, color: Colors.white),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            onDismissed: onDismissed,
            key: ValueKey<String>(modelVideo.id),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQueryHelper.sizeFromHeight(context, 4.5),
              child: Center(
                child: Text(
                  name,
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
