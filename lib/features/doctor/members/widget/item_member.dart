import 'package:flutter/material.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/images.dart';

class PatientItem extends StatelessWidget {
  const PatientItem(
      {super.key, required this.patientName, required this.onTap});
  final String patientName;
  final void Function()? onTap;

  @override
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
        onTap: onTap,
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
