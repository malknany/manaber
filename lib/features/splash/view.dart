import 'dart:async';

import 'package:flutter/material.dart';
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
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
