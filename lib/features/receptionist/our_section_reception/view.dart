import 'package:flutter/material.dart';
import 'package:manaber/features/regitration/login/model.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../insert_data/controler.dart';
import '../receptionist_profile/view.dart';
import 'widgets/section_item.dart';

class OurSectiosnReceptionist extends StatelessWidget {
  OurSectiosnReceptionist({Key? key, required this.usersModel})
      : super(key: key);
  final StepperReceptionist controleReceptionist = StepperReceptionist();
  final UsersModel usersModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(
                    context,
                    ReceptionistProfile(
                      usersModel: usersModel,
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
                        department: 'PHYSICAL_THERAPY',
                        image: AppImages.occupationalTherapy,
                        sectionname: 'العلاج الطبيعي',
                        controleReceptionist: controleReceptionist),
                    SectionItemReceptionist(
                        department: 'OCCUPATIONAL_THERAPY',
                        image: AppImages.naturalTherapy,
                        sectionname: 'العلاج الوظيفي',
                        controleReceptionist: controleReceptionist),
                    SectionItemReceptionist(
                      department: 'SPEECH_THERAPY',
                      image: AppImages.occupational,
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
