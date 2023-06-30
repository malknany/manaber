import 'package:flutter/material.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class SlectedItemProfile extends StatelessWidget {
  const SlectedItemProfile({super.key, required this.sectionname});
  final String sectionname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        shadowColor: AppColors.primarycolor,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            // color: AppColors.grey,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: MediaQueryHelper.sizeFromHeight(context, 4.5),
          width: MediaQueryHelper.sizeFromWidth(context, 1.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/ux.png',
                  height: 100, color: AppColors.primarycolor),
              Text(
                sectionname,
                style: AppTextStyles.lrTitles
                    .copyWith(color: AppColors.primarycolor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
