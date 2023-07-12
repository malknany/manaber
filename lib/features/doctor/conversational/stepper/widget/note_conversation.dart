import 'package:flutter/material.dart';
import '../controler.dart';
import '../../../../../shared/components/components.dart';

import '../../../../../shared/styles/colors.dart';

class NoteConversation extends StatelessWidget {
  const NoteConversation({super.key, required this.controleConversational});
  final ControleConversational controleConversational;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملاحظات'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  textEditingController: controleConversational
                      .listOfNoteConversation[index].controle,
                  labelname: controleConversational
                      .listOfNoteConversation[index].lable);
            },
            separatorBuilder: (context, index) {
              if (index.isNaN) {
                return ButtonText(
                    text: "حفظ",
                    onPressed: () {
                      Navigator.pop(context, 'refresh');
                    });
              } else {
                return const SizedBox.shrink();
              }
            },
            itemCount: controleConversational.listOfNoteConversation.length),
      ),
    );
  }
}
