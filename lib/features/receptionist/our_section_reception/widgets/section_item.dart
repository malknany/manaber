import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
import '../../insert_data/controler.dart';
import '../../insert_data/cubit/reception_cubit.dart';
import '../../insert_data/view.dart';

class SectionItemReceptionist extends StatelessWidget {
  const SectionItemReceptionist(
      {required this.sectionName,
      required this.image,
      Key? key,
      required this.controlReceptionist,
      required this.department})
      : super(key: key);
  final String sectionName;
  final StepperReceptionist controlReceptionist;
  final String image;
  final String department;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            BlocProvider(
              create: (context) => ReceptionCubit(),
              child: ReceptionistDataEntry(
                controlReceptionist: controlReceptionist,
                department: department,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          shadowColor: AppColors.primaryColor,
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
                  sectionName,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
