import 'package:flutter/material.dart';
import 'package:manaber/features/doctor/members/view.dart';
import 'package:manaber/features/doctor/our_sections/widgets/section_item.dart';
import 'package:manaber/features/doctor/profile_doctor/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/images.dart';
import 'package:manaber/shared/styles/styles.dart';

class Oursectiosn extends StatelessWidget {
  Oursectiosn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, const ProfileDoctor());
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
                      onTap: () => navigateTo(
                            context,
                            Members(counter: 0),
                          ),
                      child: const SectionItem(
                        sectionname: 'العلاج الطبيعي',
                        image: AppImages.occupationalTherapy,
                      )),
                  InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            Members(
                              counter: 1,
                            ));
                      },
                      child: const SectionItem(
                        sectionname: 'العلاج الوظيفي',
                        image: AppImages.occupational,
                      )),
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        Members(
                          counter: 2,
                        ),
                      );
                    },
                    child: const SectionItem(
                      sectionname: 'التخاطب',
                      image: AppImages.conversational,
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
