import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/cubit/splash_cubit.dart';
import 'shared/network/local/shared_preferences.dart';
import 'shared/network/remote/dio_helper.dart';
import 'features/splash/view.dart';
import 'shared/styles/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: BlocProvider(
        create: (context) => SplashCubit(),
        child: const SplashScreen(),
      ),
    );
  }
}
