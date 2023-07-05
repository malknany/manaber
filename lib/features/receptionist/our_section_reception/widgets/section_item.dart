import 'package:flutter/material.dart';
import 'package:manaber/features/receptionist/insert_data/controler.dart';
import 'package:manaber/features/receptionist/insert_data/view.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class SectionItemReceptionist extends StatelessWidget {
  const SectionItemReceptionist(
      {required this.sectionname,
      required this.image,
      Key? key,
      required this.controleReceptionist})
      : super(key: key);
  final String sectionname;
  final StepperReceptionist controleReceptionist;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context,
            ReceptionistDataEntry(controleReceptionist: controleReceptionist));
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
      ),
    );
  }
}
