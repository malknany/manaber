import 'package:flutter/material.dart';
import '../../../../shared/styles/colors.dart';

class ItemRadioButton extends StatelessWidget {
  const ItemRadioButton(
      {super.key,
      required this.onChanged,
      required this.groupValue,
      required this.value,required this.title});
  final void Function(dynamic)? onChanged;
  final dynamic groupValue;
  final dynamic value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        titleAlignment: ListTileTitleAlignment.center,
        title:  Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Radio(
          autofocus: false,
          activeColor: AppColors.primarycolor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}