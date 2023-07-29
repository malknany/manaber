import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/receptionist/receptionist_profile/profile/cubit/receptionist_profile_cubit.dart';
import 'package:manaber/features/receptionist/receptionist_profile/profile/view.dart';
import 'package:manaber/shared/network/local/const_key.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../insert_data/controler.dart';
import 'widgets/section_item.dart';

class OurSectiosnReceptionist extends StatelessWidget {
  OurSectiosnReceptionist({
    Key? key,
  }) : super(key: key);
  final StepperReceptionist controleReceptionist = StepperReceptionist();
  // final UsersModel usersModel;

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
                      create: (context) => ReceptionistProfileCubit(),
                      child: const ReceptionistProfileScreen(),
                    ));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('أقسامنا',
                    style: AppTextStyles.lrTitles.copyWith(fontSize: 32)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SectionItemReceptionist(
                        department: AppConstKey.physicalTherapy,
                        image: AppImages.login1,
                        sectionname: 'العلاج الطبيعي',
                        controleReceptionist: controleReceptionist),
                    SectionItemReceptionist(
                        department: AppConstKey.occupationalTherapy,
                        image: AppImages.signup1,
                        sectionname: 'العلاج الوظيفي',
                        controleReceptionist: controleReceptionist),
                    SectionItemReceptionist(
                      department: AppConstKey.speechTherapy,
                      image: AppImages.conversational1,
                      sectionname: 'تعديل سلوك',
                      controleReceptionist: controleReceptionist,
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
