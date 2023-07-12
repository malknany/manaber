import 'package:flutter/material.dart';
import '../members/view.dart';
import 'widgets/section_item.dart';
import '../profile_doctor/view.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class Oursectiosn extends StatelessWidget {
 const  Oursectiosn({Key? key}) : super(key: key);

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
                            const Members(counter: 0),
                          ),
                      child: const SectionItem(
                        sectionname: 'العلاج الطبيعي',
                        image: AppImages.occupationalTherapy,
                      )),
                  InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            const Members(
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
                        const Members(
                          counter: 2,
                        ),
                      );
                    },
                    child: const SectionItem(
                      sectionname: 'تعديل سلوك واضطراب الطفولة',
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
