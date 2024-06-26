import 'package:flutter/material.dart';

import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/styles.dart';

class ItemProfileCardReception extends StatelessWidget {
  const ItemProfileCardReception(
      {super.key,
      required this.name,
      required this.number,
      required this.onPressed});
  final String name;
  final String number;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        shadowColor: AppColors.primaryColor,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الاسم:$name',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primaryColor, fontSize: 18),
                ),
                Text(
                  textDirection: TextDirection.rtl,
                  'رقم الهاتف :$number',
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primaryColor, fontSize: 18),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: onPressed,
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
