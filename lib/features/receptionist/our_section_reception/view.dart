import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../receptionist_profile/profile/cubit/receptionist_profile_cubit.dart';
import '../receptionist_profile/profile/view.dart';
import '../../../shared/network/local/const_key.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../insert_data/controler.dart';
import 'widgets/section_item.dart';

class OurSectionsReceptionist extends StatelessWidget {
  OurSectionsReceptionist({
    Key? key,
  }) : super(key: key);
  final StepperReceptionist controlReceptionist = StepperReceptionist();
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
                        sectionName: 'العلاج الطبيعي',
                        controlReceptionist: controlReceptionist),
                    SectionItemReceptionist(
                        department: AppConstKey.occupationalTherapy,
                        image: AppImages.signup1,
                        sectionName: 'العلاج الوظيفي',
                        controlReceptionist: controlReceptionist),
                    SectionItemReceptionist(
                      department: AppConstKey.speechTherapy,
                      image: AppImages.conversational1,
                      sectionName: 'تعديل سلوك',
                      controlReceptionist: controlReceptionist,
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
