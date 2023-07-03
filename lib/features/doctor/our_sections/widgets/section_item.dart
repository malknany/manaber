import 'package:flutter/material.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({required this.sectionname, Key? key}) : super(key: key);
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/image/ux.png',
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
