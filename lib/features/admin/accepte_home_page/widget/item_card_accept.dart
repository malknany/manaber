import 'package:flutter/material.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class ItemAccepteAdmin extends StatelessWidget {
  const ItemAccepteAdmin(
      {super.key,
      required this.name,
      required this.job,
      required this.number,
      required this.onPressedOk,
      required this.onPressedNo});
  final String name;
  final String job;
  final String number;
  final onPressedOk;
  final onPressedNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        shadowColor: AppColors.primarycolor,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: MediaQuery.sizeOf(context).height / 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  name,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primarycolor),
                ),
              ),
              Expanded(
                child: Text(
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  job,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primarycolor),
                ),
              ),
              Expanded(
                child: Text(
                  number,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: AppColors.primarycolor),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: onPressedOk,
                        icon: const Icon(
                          Icons.check_circle_outline_outlined,
                          color: AppColors.primarycolor,
                        )),
                    IconButton(
                        onPressed: onPressedNo,
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
