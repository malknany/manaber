import 'package:flutter/material.dart';
import 'package:manaber/features/regitration/login/model.dart';
import '../members/view.dart';
import 'widgets/section_item.dart';
import '../profile_doctor/view.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class Oursectiosn extends StatelessWidget {
  const Oursectiosn({Key? key, required this.usersModel}) : super(key: key);
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
                    ProfileDoctor(
                      usersModel: usersModel,
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
                          image: AppImages.login1,
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
                          image: AppImages.signup1,
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
                        image: AppImages.conversational1,
                      ),
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
