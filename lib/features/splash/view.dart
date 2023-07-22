import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/regitration/login/cubit/log_in_cubit.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import '../regitration/login/view.dart';
import '../../shared/components/navigator.dart';
import '../../shared/styles/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print("Token====${CacheHelper.getData(key: AppConstKey.token)}");
    Timer(const Duration(seconds: 4), () {
      navigateTo(
          context,
          BlocProvider(
            create: (context) => LogInCubit(),
            child: const LogInScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
