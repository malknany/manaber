import 'package:flutter/material.dart';

// import '../../../../shared/components/constants.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/styles.dart';

class ItemCardDoctor extends StatelessWidget {
  const ItemCardDoctor(
      {super.key,
      required this.onPressed,
      required this.name,
      required this.phone});
  final String name;
  final String phone;
  final void Function()? onPressed;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الاسم:$name',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.lrTitles.copyWith(
                    fontSize: 18,
                    color: AppColors.primarycolor,
                  ),
                ),
                Text(
                  'رقم الهاتف :$phone',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.lrTitles.copyWith(
                    color: AppColors.primarycolor,
                    fontSize: 18,
                  ),
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
