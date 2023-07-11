import 'package:flutter/material.dart';
import 'package:manaber/features/receptionist/receptionist_profile/widget/edite_profile_receptio.dart';
import 'package:manaber/features/receptionist/receptionist_profile/widget/item_card_profile.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class ReceptionistProfile extends StatefulWidget {
  const ReceptionistProfile({super.key});

  @override
  State<ReceptionistProfile> createState() => _ReceptionistProfileState();
}

class _ReceptionistProfileState extends State<ReceptionistProfile> {
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
              child: Image.asset(AppImages.receptionist)),
          Text(
            'موظف الاستقبال',
            style: AppTextStyles.boldtitles.copyWith(fontSize: 32),
          ),
          ItemProfileCardReception(
            name: controllerName.text.isEmpty
                ? 'محمد احمد الكناني'
                : controllerName.text,
            number: controllerPhone.text.isEmpty
                ? '0102166884'
                : controllerPhone.text,
            onPressed: () async {
              final result = await navigateTo(
                  context,
                  EditeProfileReceptionist(
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
