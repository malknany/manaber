import 'package:flutter/material.dart';

import '../../../../../../shared/components/components.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../../../shared/styles/images.dart';
import '../../../../../../shared/styles/styles.dart';
import '../../../model.dart';

class NoteConversationalView extends StatelessWidget {
  const NoteConversationalView(
      {super.key,
      required this.modelNoteConversational});

  final List<ModelPatientInfo> modelNoteConversational;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ملاحظات',
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ListView(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Image.asset(AppImages.conversational1)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'معلومات عن المريض ',
                  style: AppTextStyles.smTitles.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: List.generate(
                    modelNoteConversational.length,
                    (index) => InfoRowItem(
                        textDirection: TextDirection.rtl,
                        title: modelNoteConversational[index].question!,
                        value:
                            modelNoteConversational[index].answer ?? 'لايوجد')),
              ),
            ],
          )),
    );
  }
}
