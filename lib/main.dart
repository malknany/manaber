import 'package:flutter/material.dart';
import 'package:manaber/features/splash/view.dart';
import 'package:manaber/shared/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}
