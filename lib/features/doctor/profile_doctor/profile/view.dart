import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_doctor/edite_profile/cubit/edite_profile_doctor_cubit.dart';
import 'package:manaber/features/doctor/profile_doctor/profile/cubit/profile_doctor_cubit.dart';
import 'package:manaber/shared/styles/colors.dart';
import '../edite_profile/view.dart';
import 'widget/item_card_doctor.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/images.dart';
import '../../../../shared/styles/styles.dart';

class ProfileDoctorScreen extends StatefulWidget {
  const ProfileDoctorScreen({
    super.key,
  });
  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  @override
  void initState() {
    context.read<DoctorProfileCubit>().getProfileDoctor();
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
              child: Image.asset(AppImages.doctor)),
          Text(
            'الطبيب',
            style: AppTextStyles.boldtitles.copyWith(fontSize: 32),
          ),
          BlocBuilder<DoctorProfileCubit, DoctorProfileState>(
            builder: (context, state) {
              if (state is DoctorProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primarycolor,
                  ),
                );
              }
              if (state is DoctorProfileError) {
                return Text(
                  state.msg,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.lrTitles
                      .copyWith(color: Colors.red, fontSize: 15),
                );
              }
              if (state is DoctorProfileSuccess) {
                final model = state.modelDoctorProfile;
                return ItemCardDoctor(
                  name: model.name,
                  phone: model.phoneNumber,
                  onPressed: () async {
                    final result = await navigateTo(
                        context,
                        BlocProvider(
                          create: (context) => EditeProfileDoctorCubit(),
                          child: EditeProfileDoctorScreen(
                            modelProfileDoctor: model,
                          ),
                        ));
                    if (result == 'refrech') {
                      context.read<DoctorProfileCubit>().getProfileDoctor();
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