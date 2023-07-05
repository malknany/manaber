import 'package:flutter/material.dart';
import 'package:manaber/features/receptionist/receptionist_profile/widget/item_card_profile.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class ReceptionistProfile extends StatelessWidget {
  const ReceptionistProfile({super.key});

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
              child: Image.asset(AppImages.receptionist)),
          Text(
            'موظف الاستقبال',
            style: AppTextStyles.boldtitles.copyWith(fontSize: 32),
          ),
          ItemProfileCard(name: 'محمد احمد الكناني', number: '0102166884'),
        ],
      ),
    );
  }
}
