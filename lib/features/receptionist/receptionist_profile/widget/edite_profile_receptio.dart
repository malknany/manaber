import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';

class EditeProfileReceptionist extends StatelessWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerPhone;
  final TextEditingController controllerPassword;

  const EditeProfileReceptionist(
      {super.key,
      required this.controllerName,
      required this.controllerPassword,
      required this.controllerPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل بيانات الطبيب'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  textEditingController: controllerName,
                  labelname: 'الاسم'),
              TextFormFiledStepper(
                  textInputType: TextInputType.phone,
                  textDirection: TextDirection.rtl,
                  textEditingController: controllerPhone,
                  labelname: 'رقم الهاتف'),
              TextFormFiledStepper(
                  textDirection: TextDirection.rtl,
                  textEditingController: controllerPassword,
                  labelname: 'كلمة السر'),
              ButtonText(
                  text: 'حفظ',
                  onPressed: () {
                    Navigator.pop(context,'refresh');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
