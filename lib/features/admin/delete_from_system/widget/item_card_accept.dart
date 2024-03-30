import 'package:flutter/material.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

class ItemDeleteAdmin extends StatelessWidget {
  const ItemDeleteAdmin({
    Key? key,
    required this.name,
    required this.job,
    required this.number,
    required this.onPressedNo,
  }) : super(key: key);

  final String name;
  final String job;
  final String number;
  final void Function()? onPressedNo;

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                name,
                style: AppTextStyles.lrTitles.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                textDirection: TextDirection.rtl,
                job,
                style: AppTextStyles.lrTitles.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                textDirection: TextDirection.rtl,
                number,
                style: AppTextStyles.lrTitles.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: onPressedNo,
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                  ),
                  const Text('حذف من النظام '),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
