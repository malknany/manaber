import 'package:flutter/material.dart';


import 'package:manaber/features/receptionist/insert_data/controler.dart';
import 'package:manaber/features/receptionist/insert_data/view.dart';
import 'package:manaber/features/receptionist/our_section/widgets/section_item.dart';
import 'package:manaber/features/receptionist/receptionist_profile/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/styles.dart';

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
                  GestureDetector(
                      onTap: () {
                        navigateTo(
                            context,
                            ReceptionistDataEntry(
                                controleReceptionist: controleReceptionist));
                      },
                      child: const SectionItem(sectionname: 'العلاج الطبيعي')),
                  GestureDetector(
                      onTap: () {
                        navigateTo(
                            context,
                            ReceptionistDataEntry(
                                controleReceptionist: controleReceptionist));
                      },
                      child: const SectionItem(sectionname: 'العلاج الوظيفي')),
                  GestureDetector(
                    onTap: () {
                      navigateTo(
                          context,
                          ReceptionistDataEntry(
                              controleReceptionist: controleReceptionist));
                    },
                    child: const SectionItem(
                      sectionname: 'التخاطب',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
