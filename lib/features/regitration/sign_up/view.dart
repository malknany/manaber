import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';
import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/styles/colors.dart';

enum JobType { doctor, receptionist }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  JobType _jobType = JobType.doctor;
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
              suffixIcon: Icon(Icons.person),
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
            TextFieldTemplate(
              hintText: 'تأكيد كلمة السر',
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
                        fontSize: 25,
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
                            fontSize: 25,
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
                elevation: 0,
                backgroundColor: AppColors.primarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
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
      )),
    );
  }
}