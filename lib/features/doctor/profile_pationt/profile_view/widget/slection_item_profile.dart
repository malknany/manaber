import 'package:flutter/material.dart';

import '../../../../../shared/components/constants.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/styles.dart';

class SlectedItemProfile extends StatelessWidget {
  const SlectedItemProfile(
      {super.key, required this.sectionname, required this.image,required this.onTap});
  final String sectionname;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
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
            width: MediaQueryHelper.sizeFromWidth(context, 1.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 10,
                  child: Image.asset(
                    image,
                    height: 100,
                  ),
                ),
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