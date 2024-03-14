import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/item_radio_button.dart';
import 'cubit/sign_up_cubit.dart';
import '../../../shared/styles/styles.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';

enum JobType { DOCTOR, RECEPTIONIST }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();

  bool isPassword = true;
  bool passwordConfi = true;
  JobType _jobType = JobType.DOCTOR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(child: Image.asset(AppImages.signup1),),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'انشاء حساب جديد',
                          style: AppTextStyles.boldtitles.copyWith(fontSize: 20),
                        ),
                        TextFieldTemplate(
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال الاسم';
                            }
                            return null;
                          },
                          hintText: 'الاسم',
                          suffixIcon:
                              const Icon(Icons.person, color: AppColors.primarycolor),
                        ),
                        TextFieldTemplate(
                          controller: phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال رقم الهاتف';
                            }
                            if (!RegExp(r'^\+?\d{10,12}$').hasMatch(value)) {
                              return 'يرجى إدخال رقم هاتف صحيح';
                            }
                            return null;
                          },
                          textInputType: TextInputType.phone,
                          hintText: 'رقم الهاتف',
                          suffixIcon:
                              const Icon(Icons.phone, color: AppColors.primarycolor),
                        ),
                        TextFieldTemplate(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال كلمة المرور';
                            }
                            if (value.length < 6) {
                              return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
                            }
                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
                                .hasMatch(value)) {
                              return 'يجب أن تحتوي كلمة المرور على حرف كبير وحرف صغير ورقم واحد على الأقل';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال تأكيد كلمة المرور';
                            }
                            if (value != password.text) {
                              return 'كلمة المرور وتأكيد كلمة المرور غير متطابقين';
                            }
                            return null;
                          },
                          hintText: 'تأكيد كلمة السر',
                          isPassword: passwordConfi,
                          suffixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.primarycolor,
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordConfi = !passwordConfi;
                              });
                            },
                            icon: Icon(
                              passwordConfi ? Icons.visibility : Icons.visibility_off,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemRadioButton(
                              onChanged: (value) {
                                setState(() {
                                  _jobType = value!;
                                  
                                });
                              },
                              groupValue: _jobType,
                              value: JobType.DOCTOR,
                              title: 'طبيب',
                            ),
                            ItemRadioButton(
                              onChanged: (value) {
                                setState(() {
                                  _jobType = value!;
                                  
                                });
                              },
                              groupValue: _jobType,
                              value: JobType.RECEPTIONIST,
                              title: 'موظف الاستقبال',
                            ),
                          ],
                        ),
                        ButtonText(
                          text: 'تسجيل',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignUpCubit>().signUpPostData(
                                  name: name.text,
                                  phone: phone.text,
                                  jobType: _jobType.name,
                                  password: password.text,
                                  );
                            }
                          },
                        ),
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            if (state is SignUpLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primarycolor,
                                ),
                              );
                            }
                            if (state is SignUpSuccess) {
                              Future.delayed(
                                const Duration(seconds: 3),
                                () {
                                  Navigator.pop(context);
                                },
                              );
                              return Center(
                                child: Text(
                                  'تم رفع المعلومات وفي انتظار الموافقة',
                                  textDirection: TextDirection.rtl,
                                  style: AppTextStyles.lrTitles.copyWith(
                                      color: AppColors.primarycolor, fontSize: 15),
                                ),
                              );
                            }
                            if (state is SignUpErorr) {
                              return Text(
                                'رقم الهاتف مستخدم بالفعل',
                                textDirection: TextDirection.rtl,
                                style: AppTextStyles.lrTitles
                                    .copyWith(color: Colors.red, fontSize: 15),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        Text(
                          'او',
                          style:
                              AppTextStyles.boldtitles.copyWith(color: Colors.black),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                            enableFeedback: false,
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('تسجيل دخول',
                              style: AppTextStyles.boldtitles
                                  .copyWith(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phone.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
  }
}

// snackBar(String text, context) {
//   final snackBar = SnackBar(
//     duration: const Duration(seconds: 2),
//     content: Text(
//       text,
//       style: AppTextStyles.lrTitles.copyWith(color: Colors.white),
//     ),
//     backgroundColor: AppColors.primarycolor,
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   Future.delayed(
//     const Duration(seconds: 6),
//     () {
//       Navigator.of(context).pop();
//     },
//   );
// }
