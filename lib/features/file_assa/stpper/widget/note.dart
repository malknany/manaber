import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/info_view/view.dart';
import 'package:manaber/features/file_assa/stpper/controller.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';

class Note extends StatelessWidget {
  Note({super.key,required this.control});

  final TextEditingController controller1 = TextEditingController();
  final StepperControl control;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Note'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormFiledStepper(
                  labelname: 'Note', textEditingController: controller1),
              ButtonText(
                  text: 'Save',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FileAssassemntScreen(control: control),));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
