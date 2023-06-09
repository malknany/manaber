import 'dart:async';

import 'package:flutter/material.dart';
import 'package:manaber/features/regitration/login/view.dart';
import 'package:manaber/features/regitration/sign_up/view.dart';
// import 'package:manaber/shared/components/constants.dart';
import 'package:manaber/shared/components/navigator.dart';
import 'package:manaber/shared/styles/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      navigateTo(context, const LogInScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 400,
        width: 400,
        child:Image.asset("assets/images/ux.png"),
      ),
    );
  }
}
