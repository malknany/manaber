import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile_doctor/profile/cubit/profile_doctor_cubit.dart';
import '../../../shared/network/local/const_key.dart';
import 'widgets/section_item.dart';
import '../profile_doctor/profile/view.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class OurSections extends StatelessWidget {
  const OurSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(
                    context,
                    BlocProvider(
                      create: (context) => DoctorProfileCubit(),
                      child: const ProfileDoctorScreen(),
                    ));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('أقسامنا',
                    style: AppTextStyles.lrTitles.copyWith(fontSize: 32)),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SectionItem(
                      department: AppConstKey.physicalTherapy,
                      sectionName: 'العلاج الطبيعي',
                      image: AppImages.login1,
                    ),
                    SectionItem(
                      department: AppConstKey.occupationalTherapy,
                      sectionName: 'العلاج الوظيفي',
                      image: AppImages.signup1,
                    ),
                    SectionItem(
                      department: AppConstKey.speechTherapy,
                      sectionName: 'تعديل سلوك ',
                      image: AppImages.conversational1,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
