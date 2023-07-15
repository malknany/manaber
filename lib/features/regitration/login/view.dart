import 'package:flutter/material.dart';
import '../../admin/accepte_home_page/view.dart';
import '../../receptionist/our_section_reception/view.dart';
import '../sign_up/view.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

import '../../doctor/our_sections/view.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController number = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Image.asset(AppImages.login1),
              const Text(
                'تسجيل الدخول ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold),
              ),
              TextFieldTemplate(
                controller: number,
                textInputType: TextInputType.number,
                hintText: 'رثم الهاتف',
                suffixIcon: const Icon(
                  Icons.phone,
                  color: AppColors.primarycolor,
                ),
              ),
              TextFieldTemplate(
                controller: password,
                isPassword: isPassword,
                hintText: 'كلمة السر',
                suffixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.primarycolor,
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: Icon(
                    isPassword ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'نسيت كلمة السر ؟',
                  style: AppTextStyles.smTitles,
                ),
              ),
              ButtonText(
                text: 'تسجيل',
                onPressed: () {
                  if (number.text == '5050' && password.text == '123') {
                    navigateTo(context, const Oursectiosn());
                  } else if (number.text == '1010' && password.text == '123') {
                    navigateTo(context, OurSectiosnReceptionist());
                  } else if (number.text == '2020' && password.text == '123') {
                    navigateTo(context, const AdminHomePage());
                  }
                },
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
        ),
      )),
    );
  }
}
