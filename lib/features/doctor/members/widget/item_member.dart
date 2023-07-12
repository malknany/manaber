import 'package:flutter/material.dart';
import '../model.dart';
import '../view.dart';
import '../../../../shared/styles/colors.dart';

class MemberItem extends Members {
  MemberItem({required this.index, Key? key}) : super(key: key, counter: index);
  final int index;
  final List<Model> display_list = List.from(mainList);

  Widget build(BuildContext context) {
    return Material(
      shadowColor: AppColors.primarycolor,
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          onTap: () {},
          selected: true,
          selectedColor: Colors.white,
          contentPadding: const EdgeInsets.all(8),
          title: Text(
            display_list[index].title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          // subtitle: Text(
          //   display_list[index].subtitle!,
          //   style: const TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Color(0xff3A229B)),
          // ),
          leading: Image.asset(display_list[index].image!),
        ),
      ),
    );
  }
}
