import 'package:flutter/material.dart';
import '../../../../../shared/components/constants.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../shared/styles/styles.dart';

class ItemCardVideo extends StatelessWidget {
  const ItemCardVideo(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.onTap,
      required this.isDelete});
  final String name;
  final bool isDelete;
  final void Function()? onTap;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            child: Stack(
              children: [
                Center(
                  child: Text(
                    name,
                    style: AppTextStyles.lrTitles
                        .copyWith(color: AppColors.primarycolor),
                  ),
                ),
                isDelete
                    ? Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: onPressed,
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
