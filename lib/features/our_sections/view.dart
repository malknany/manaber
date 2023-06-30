import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/info_view/view.dart';
import 'package:manaber/features/file_assa/stpper/controller.dart';
import 'package:manaber/features/our_sections/widgets/section_item.dart';
import 'package:manaber/features/profile_doctor/view.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/styles.dart';

class Oursectiosn extends StatelessWidget {
   Oursectiosn({Key? key}) : super(key: key);

  final StepperControl control = StepperControl();

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
                      onTap: () => navigateTo(context, FileAssassemntScreen(control: control,)),
                      child: const SectionItem(sectionname: 'العلاج الطبيعي')),
                  const SectionItem(sectionname: 'العلاج الوظيفي'),
                  const SectionItem(
                    sectionname: 'التخاطب',
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
