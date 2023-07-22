import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/admin/accepte_home_page/cubit/pending_cubit.dart';
import 'package:manaber/features/receptionist/our_section_reception/view.dart';
import 'package:manaber/features/regitration/login/cubit/log_in_cubit.dart';
import 'package:manaber/features/regitration/sign_up/cubit/sign_up_cubit.dart';
import 'package:manaber/shared/styles/styles.dart';
import '../../admin/accepte_home_page/view.dart';

import '../forget_pass/forget_pass.dart';
import '../sign_up/view.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';

import '../../doctor/our_sections/view.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى إدخال رقم الهاتف';
                    }
                    if (!RegExp(r'^\+?\d{10,12}$').hasMatch(value)) {
                      return 'يرجى إدخال رقم هاتف صحيح';
                    }
                    return null;
                  },
                  controller: phone,
                  textInputType: TextInputType.number,
                  hintText: 'رثم الهاتف',
                  suffixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.primarycolor,
                  ),
                ),
                TextFieldTemplate(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى إدخال كلمة المرور';
                    }
                    if (value.length < 4) {
                      return 'يجب أن تتكون كلمة المرور من 4 أحرف على الأقل';
                    }
                    return null;
                  },
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
                  child: TextButton(
                      onPressed: () {
                        navigateTo(context, const ForgetPass());
                      },
                      child: const Text('هل نسيت كلمة السر ؟',
                          style: TextStyle(color: AppColors.primarycolor))),
                ),
                ButtonText(
                  text: 'تسجيل',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      context.read<LogInCubit>().logInPostData(
                          phone: phone.text, password: password.text);
                    }
                  },
                ),
                BlocBuilder<LogInCubit, LoginStates>(
                  builder: (context, state) {
                    if (state is LoginLoadingtState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primarycolor,
                        ),
                      );
                    }
                    if (state is LoginSuccessState) {
                      if (state.usersModel.role == 'DOCTOR') {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          navigateAndFinished(
                              context,
                              Oursectiosn(
                                usersModel: state.usersModel,
                              ));
                        });
                      }
                      if (state.usersModel.role == 'RECEPTIONIST') {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          navigateAndFinished(
                              context,
                              OurSectiosnReceptionist(
                                usersModel: state.usersModel,
                              ));
                        });
                      }
                      if (state.usersModel.role == 'ADMIN') {
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            navigateAndFinished(
                                context,
                                BlocProvider(
                                  create: (context) => PendingCubit(),
                                  child: const AdminHomePage(),
                                ));
                            // if (result == 'refresh') {}
                          },
                        );
                      }
                      return const Center(
                          child: Icon(
                        Icons.check,
                        color: AppColors.primarycolor,
                      ));
                    }
                    if (state is LoginErrorState) {
                      return Text(
                        state.msg,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.lrTitles
                            .copyWith(color: Colors.red, fontSize: 15),
                      );
                    }
                    return const SizedBox.shrink();
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
                    navigateTo(
                      context,
                      BlocProvider(
                        create: (context) => SignUpCubit(),
                        child: const SignUpScreen(),
                      ),
                    );
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
      ),
    );
  }
}

// Dio creatAndSutUpDio() {
  //   Dio dio = Dio();

  //   dio
  //     ..options.connectTimeout = Duration(seconds: 20)
  //     ..options.receiveTimeout = Duration(seconds: 20);

  //   dio.interceptors.add(LogInterceptor(
  //     responseBody: true,
  //     error: true,
  //     requestHeader: false,
  //     responseHeader: false,
  //     requestBody: true,
  //     request: true,
  //   ));

  //   return dio;
  // }
