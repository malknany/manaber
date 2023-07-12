import 'package:flutter/material.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({required this.sectionname, Key? key, required this.image})
      : super(key: key);
  final String sectionname;
  final String image;

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
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 8,
                width: MediaQuery.sizeOf(context).width / 8,
                child: Image.asset(
                  image,
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
    );
  }
}
