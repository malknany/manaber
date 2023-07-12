import 'package:flutter/material.dart';
import 'widget/edite_profile.dart';
import 'widget/item_card_doctor.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class ProfileDoctor extends StatefulWidget {
  const ProfileDoctor({super.key});

  @override
  State<ProfileDoctor> createState() => _ProfileDoctorState();
}

class _ProfileDoctorState extends State<ProfileDoctor> {
  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerPhone = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();

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
          ItemCardDoctor(
            name: controllerName.text.isEmpty
                ? ' محمد الكناني'
                : controllerName.text,
            phone: controllerPhone.text.isEmpty
                ? '01021986038'
                : controllerPhone.text,
            onPressed: () async {
              final result = await navigateTo(
                  context,
                  EditeProfile(
                    controllerName: controllerName,
                    controllerPhone: controllerPhone,
                    controllerPassword: controllerPassword,
                  ));
              if (result == "refresh") {
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
