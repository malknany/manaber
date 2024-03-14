import 'package:flutter/material.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

class SectionItemAdmin extends StatelessWidget {
  const SectionItemAdmin({
    required this.sectionname,
    Key? key,
    required this.screen,
    // required this.image,
    // required this.department,
  }) : super(key: key);
  final String sectionname;
  // final String image;
  // final String department;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, screen);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          shadowColor: AppColors.primarycolor,
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQueryHelper.sizeFromHeight(context, 4.5),
            // width: MediaQueryHelper.sizeFromWidth(context, 1.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sectionname,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primarycolor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
