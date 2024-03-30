import 'package:flutter/material.dart';

import '../../../../shared/styles/colors.dart';

class ItemSearch extends StatelessWidget {
  const ItemSearch({super.key,required this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: AppColors.primaryColor)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "أدخل الاسم..",
            prefixIcon: const Icon(Icons.search, color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
