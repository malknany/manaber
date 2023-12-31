import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile_doctor/profile/cubit/profile_doctor_cubit.dart';
import '../../../shared/network/local/const_key.dart';
import 'widgets/section_item.dart';
import '../profile_doctor/profile/view.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class Oursectiosn extends StatelessWidget {
  const Oursectiosn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أقسامنا',
            style: AppTextStyles.lrTitles.copyWith(fontSize: 32)),
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
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SectionItem(
                            department: AppConstKey.physicalTherapy,
                            sectionname: 'العلاج الطبيعي',
                            image: AppImages.login1,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SectionItem(
                            department: AppConstKey.occupationalTherapy,
                            sectionname: 'العلاج الوظيفي',
                            image: AppImages.signup1,
                          ),
                        ),
                      ],
                    ),
                    SectionItem(
                      department: AppConstKey.speechTherapy,
                      sectionname: 'تعديل سلوك ',
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

// Widget _buildContent(int index) {
//   switch (index) {
//     case 0:
//       return BlocProvider(
//         create: (context) => PatientsDepartmentCubit(),
//         child: const MembersScreen(
//           department: AppConstKey.physicalTherapy,
//         ),
//       );
//     case 1:
//       return BlocProvider(
//         create: (context) => PatientsDepartmentCubit(),
//         child: const MembersScreen(
//           department: AppConstKey.occupationalTherapy,
//         ),
//       );
//     case 2:
//       return BlocProvider(
//         create: (context) => PatientsDepartmentCubit(),
//         child: const MembersScreen(
//           department: AppConstKey.speechTherapy,
//         ),
//       );
//     default:
//       return Container();
//   }
// }


// Expanded(
          //     child: BlocProvider(
          //   create: (context) => PatientsDepartmentCubit(),
          //   child: MembersScreen(
          //     department: departments[_selectedIndex],
          //   ),
          // )),
          // Expanded(
          //   child: BlocBuilder<PatientsDepartmentCubit, PatientsDepartmentState>(
          //     builder: (context, state) {
          //       return MembersScreen(
          //         department: departments[_selectedIndex],
          //       );
          //     },
          //   ),
          // ),
