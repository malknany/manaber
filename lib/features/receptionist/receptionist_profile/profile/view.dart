import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../edite_profile/cubit/edite_profile_cubit.dart';
import '../edite_profile/view.dart';
import 'cubit/receptionist_profile_cubit.dart';
import 'widget/item_card_profile.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/images.dart';
import '../../../../shared/styles/styles.dart';

class ReceptionistProfileScreen extends StatefulWidget {
  const ReceptionistProfileScreen({
    super.key,
  });

  @override
  State<ReceptionistProfileScreen> createState() =>
      _ReceptionistProfileScreenState();
}

class _ReceptionistProfileScreenState extends State<ReceptionistProfileScreen> {
  @override
  void initState() {
    context.read<ReceptionistProfileCubit>().getInfoPatient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
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
            style: AppTextStyles.boldTitles.copyWith(fontSize: 32),
          ),
          BlocBuilder<ReceptionistProfileCubit, ReceptionistProfileState>(
            builder: (context, state) {
              if (state is ReceptionistProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
              if (state is ReceptionistProfileError) {
                return Text(
                  state.msg,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: Colors.red, fontSize: 15),
                );
              }
              if (state is ReceptionistProfileSuccess) {
                final model = state.modelReceptionistProfile;
                return ItemProfileCardReception(
                  name: model.name,
                  number: model.phoneNumber,
                  onPressed: () async {
                    final result = await navigateTo(
                        context,
                        BlocProvider(
                          create: (context) => EditProfileCubit(),
                          child: EditeProfileReceptionist(
                            modelReceptionistProfile: model,
                          ),
                        ));
                    if (result == 'refrech') {
                      context.read<ReceptionistProfileCubit>().getInfoPatient();
                    }
                  },
                );
              }
              return SizedBox.fromSize();
            },
          ),
        ],
      ),
    );
  }
}
