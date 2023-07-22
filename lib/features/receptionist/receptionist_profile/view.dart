import 'package:flutter/material.dart';
import 'package:manaber/features/regitration/login/model.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import 'widget/edite_profile_receptio.dart';
import 'widget/item_card_profile.dart';

class ReceptionistProfile extends StatefulWidget {
  const ReceptionistProfile({super.key, required this.usersModel});
  final UsersModel usersModel;

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
              onPressed: () {
                signout(context);
              },
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
                ? widget.usersModel.name
                : controllerName.text,
            number: controllerPhone.text.isEmpty
                ? widget.usersModel.phoneNumber
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
