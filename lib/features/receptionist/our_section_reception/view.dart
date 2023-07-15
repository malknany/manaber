import 'package:flutter/material.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../insert_data/controler.dart';
import '../receptionist_profile/view.dart';
import 'widgets/section_item.dart';

class OurSectiosnReceptionist extends StatelessWidget {
  OurSectiosnReceptionist({Key? key}) : super(key: key);
  final StepperReceptionist controleReceptionist = StepperReceptionist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, const ReceptionistProfile());
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
                        image: AppImages.occupationalTherapy,
                        sectionname: 'العلاج الطبيعي',
                        controleReceptionist: controleReceptionist),
                    SectionItemReceptionist(
                        image: AppImages.naturalTherapy,
                        sectionname: 'العلاج الوظيفي',
                        controleReceptionist: controleReceptionist),
                    SectionItemReceptionist(
                      image: AppImages.occupational,
                      sectionname: 'تعديل سلوك واضطراب الطفولة',
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