import 'package:flutter/material.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import 'package:manaber/shared/network/remote/dio_helper.dart';
import 'features/splash/view.dart';
import 'shared/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}
