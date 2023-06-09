import 'package:flutter/material.dart';
import 'package:manaber/features/our_sections/widgets/section_item.dart';
import 'package:manaber/shared/styles/styles.dart';

class Oursectiosn extends StatelessWidget {
  const Oursectiosn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('أقسامنا',style: AppTextStyles.lrTitles.copyWith(
                fontSize: 32
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  SectionItem(sectionname: 'العلاج الطبيعي'),
                  SectionItem(sectionname: 'العلاج الوظيفي'),
                  SectionItem(
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
