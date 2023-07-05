import 'package:flutter/material.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class ItemProfileCard extends StatelessWidget {
  const ItemProfileCard({super.key, required this.name, required this.number});
  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          width: MediaQueryHelper.sizeFromWidth(context, 1.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الاسم:$name',
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primarycolor),
                ),
                Text(
                  'رقم الهاتف :$number',
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primarycolor),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
