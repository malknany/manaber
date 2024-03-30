import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/our_sections/view.dart';
import '../../admin/our_section_admin/view.dart';
import '../../receptionist/our_section_reception/view.dart';
import 'cubit/log_in_cubit.dart';
import '../sign_up/cubit/sign_up_cubit.dart';
import '../../../shared/styles/styles.dart';

import '../sign_up/view.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';

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
                Text('تسجيل الدخول ',
                    style: AppTextStyles.boldTitles
                        .copyWith(color: Colors.black, fontSize: 20)),
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
                  hintText: 'رقم الهاتف',
                  suffixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.primaryColor,
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
                    color: AppColors.primaryColor,
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
                    if (state is LoginLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    if (state is LoginSuccessState) {
                      if (state.usersModel.role == 'DOCTOR') {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          navigateAndFinished(context, const OurSections());
                        });
                      }
                      if (state.usersModel.role == 'RECEPTIONIST') {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          navigateAndFinished(
                              context, OurSectionsReceptionist());
                        });
                      }
                      if (state.usersModel.role == 'ADMIN') {
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            navigateAndFinished(context, const AdminHomePage());
                          },
                        );
                      }
                      return const Center(
                          child: Icon(
                        Icons.check,
                        color: AppColors.primaryColor,
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
                Text(
                  'او',
                  style: AppTextStyles.boldTitles.copyWith(color: Colors.black),
                ),
                TextButton(
                  style: const ButtonStyle(
                    enableFeedback: false,
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {
                    navigateTo(
                      context,
                      BlocProvider(
                        create: (context) => SignUpCubit(),
                        child: const SignUpScreen(),
                      ),
                    );
                  },
                  child: Text('تسجيل حساب جديد',
                      style: AppTextStyles.boldTitles
                          .copyWith(color: Colors.black)),
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
