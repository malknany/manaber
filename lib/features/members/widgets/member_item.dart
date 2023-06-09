import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import '../model.dart';
import '../view.dart';

class MemberItem extends Members {
  MemberItem({required this.index, Key? key}) : super(key: key);
  int index;
  List<Model> display_list = List.from(main_list);

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: AppColors.primarycolor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13), ),
        child: ListTile(
          onTap: () {},
          selected: true,
          selectedColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
          title: Text(
            display_list[index].title!,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,

               // color: Color(0xff130B32)
    ),
          ),
          subtitle: Text(
            display_list[index].subtitle!,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff3A229B)),
          ),
          leading: Image.asset(display_list[index].image!),
        ),
      ),
    );
  }
}
