import 'package:flutter/material.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class ProfileDoctor extends StatelessWidget {
  const ProfileDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQueryHelper.sizeFromHeight(context, 4.5),
              width: MediaQueryHelper.sizeFromWidth(context, 1.2),
              child: Image.asset(AppImages.doctor)),
          Text(
            'الطبيب',
            style: AppTextStyles.boldtitles.copyWith(fontSize: 32),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Material(
              shadowColor: AppColors.primarycolor,
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  // color: AppColors.grey,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQueryHelper.sizeFromHeight(context, 4.5),
                width: MediaQueryHelper.sizeFromWidth(context, 1.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الاسم:محمد احمد الكناني',
                        style: AppTextStyles.lrTitles
                            .copyWith(color: AppColors.primarycolor),
                      ),
                      Text(
                        'رقم الهاتف :050516038132',
                        style: AppTextStyles.lrTitles
                            .copyWith(color: AppColors.primarycolor),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
