// import 'package:flutter/material.dart';
// import 'package:manaber/shared/styles/images.dart';
// import '../model.dart';
// import '../view.dart';
// import '../../../../shared/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/profile_pationt/profile_view/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

class PatientItem extends StatelessWidget {
  const PatientItem(
      {super.key, required this.counter, required this.patientName});
  final int counter;
  final String patientName;

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(8, 8),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          navigateTo(
            context,
            ProfilePationtScreen(
              index: counter,
            ),
          );
        },
        selected: true,
        selectedColor: Colors.grey,
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          patientName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff130B32),
          ),
        ),
        leading: Image.asset(AppImages.user),
      ),
    );
  }
}
