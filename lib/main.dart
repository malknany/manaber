import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/cubit/splash_cubit.dart';
import 'shared/network/local/shared_preferences.dart';
import 'shared/network/remote/dio_helper.dart';
import 'features/splash/view.dart';
import 'shared/styles/theme.dart';

void main() async {
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(800, 550);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: BlocProvider(
        create: (context) => SplashCubit(),
        child: const SplashScreen(),
      ),
    );
  }
}
