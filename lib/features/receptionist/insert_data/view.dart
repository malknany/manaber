import 'package:flutter/material.dart';
import 'package:manaber/features/receptionist/insert_data/controler.dart';

import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

class ReceptionistDataEntry extends StatelessWidget {
  const ReceptionistDataEntry({
    required this.controleReceptionist,
    super.key,
  });

  final StepperReceptionist controleReceptionist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البیانات الأولیة'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primarycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controleReceptionist.lisOfModel.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
              child: Column(
                children: [
                  TextFormFiledStepper(
                      textDirection: TextDirection.rtl,
                      textEditingController:
                          controleReceptionist.lisOfModel[index].controller,
                      labelname: controleReceptionist.lisOfModel[index].lable),
                  index == 8
                      ? DropdownButtonItem(
                          textDirection: TextDirection.rtl,
                          lableName:
                              controleReceptionist.lisOfDropdown.first.lable,
                          itemList: controleReceptionist
                              .lisOfDropdown.first.listOfItem!,
                          controller: controleReceptionist
                              .lisOfDropdown.first.controller,
                        )
                      : const SizedBox.shrink(),
                  index == 10
                      ? ButtonText(
                          text: 'حفظ',
                          onPressed: () {
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 2),
                              content: Text(
                                'تم رفع المعلومات ',
                                style: AppTextStyles.lrTitles
                                    .copyWith(color: Colors.white),
                              ),
                              backgroundColor: AppColors.primarycolor,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.of(context).pop();
                          })
                      : SizedBox.shrink(
                          child: Container(height: 20, color: Colors.black),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
