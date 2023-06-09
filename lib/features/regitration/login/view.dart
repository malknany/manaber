import 'package:flutter/material.dart';
import 'package:manaber/features/file_assa/info_view/view.dart';
import 'package:manaber/features/regitration/sign_up/view.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/colors.dart';
import 'package:manaber/shared/styles/images.dart';

import '../../our_sections/view.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Image.asset('assets/images/ux.png'),
            const Text(
              'تسجيل الدخول ',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold),
            ),
            const TextFieldTemplate(
              hintText: 'رثم الهاتف',
              suffixIcon: Icon(Icons.phone),
            ),
            TextFieldTemplate(
              hintText: 'كلمة السر',
              suffixIcon: const Icon(
                Icons.lock,
                color: AppColors.grey,
              ),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility,
                  color: AppColors.grey,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Oursectiosn());
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                elevation: 0,
                backgroundColor: AppColors.primarycolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text(
                ' تسجيل',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const Text(
              'او',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                navigateTo(context, const SignUpScreen());
              },
              child: const Text(
                'تسجيل حساب جديد',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      )),
    );
  }
}
