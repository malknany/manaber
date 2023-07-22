import 'package:flutter/material.dart';
import 'package:manaber/features/regitration/forget_pass/widgets.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/styles.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/navigator.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password', style: AppTextStyles.lrTitles),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('we have sent the code verification to:',
                      style: AppTextStyles.boldtitlesButton),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('ebraim.....@gmailcom',
                          style: AppTextStyles.smTitles),
                      TextButton(
                          onPressed: () {
                            navigateTo(context, ForgetPass());
                          },
                          child: const Text(
                            'change email.?',
                            style: TextStyle(color: AppColors.primarycolor),
                          )),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PinField(),
                          PinField(),
                          PinField(),
                          PinField(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),



           Padding(
             padding: const EdgeInsets.only(bottom: 40),
             child: Column(
               children: [
                 SizedBox(
                            height: 50,
                            width: 200,
                            child: ButtonTemplate(
                      color: AppColors.primarycolor,
                      text1: 'Reset',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                          ),
               ],
             ),
           ),

            ],
          ),
        ),
      ),
    );
  }
}
