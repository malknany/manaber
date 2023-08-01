import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/members/cubit/patients_department_cubit.dart';
import 'package:manaber/features/doctor/members/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({
    required this.sectionname,
    Key? key,
    required this.image,
    required this.department,
  }) : super(key: key);
  final String sectionname;
  final String image;
  final String department;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            BlocProvider(
              create: (context) => PatientsDepartmentCubit(),
              child: MembersScreen(
                department: department,
              ),
            ));
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
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 6,
                  width: MediaQuery.sizeOf(context).width / 6,
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
