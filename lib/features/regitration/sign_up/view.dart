import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';

enum JobType { doctor, receptionist }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPassword = true;
  JobType _jobType = JobType.doctor;
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
              Image.asset(AppImages.signup1),
              const Text(
                'انشاء حساب جديد',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold),
              ),
              const TextFieldTemplate(
                hintText: 'الاسم',
                suffixIcon: Icon(Icons.person, color: AppColors.primarycolor),
              ),
              const TextFieldTemplate(
                textInputType: TextInputType.phone,
                hintText: 'رثم الهاتف',
                suffixIcon: Icon(Icons.phone, color: AppColors.primarycolor),
              ),
              TextFieldTemplate(
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
              TextFieldTemplate(
                hintText: 'تأكيد كلمة السر',
                isPassword: isPassword,
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
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      titleAlignment: ListTileTitleAlignment.center,
                      title: const Text(
                        'طبيب',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio(
                        autofocus: true,
                        activeColor: AppColors.primarycolor,
                        value: JobType.doctor,
                        groupValue: _jobType,
                        onChanged: (JobType? value) {
                          setState(() {
                            _jobType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('موظف الاستقبال',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: 'Schyler',
                              fontWeight: FontWeight.bold)),
                      leading: Radio(
                        activeColor: AppColors.primarycolor,
                        autofocus: false,
                        value: JobType.receptionist,
                        groupValue: _jobType,
                        onChanged: (JobType? value) {
                          setState(() {
                            _jobType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ButtonText(text: 'تسجيل', onPressed: () {}),
              const Text(
                'او',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'تسجيل دخول',
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
