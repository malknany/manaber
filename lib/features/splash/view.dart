import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<SplashCubit>(context).checkToken(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          if (state is SplashLoading) {
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(AppImages.logo),
                  ),
                  const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            );
          }
          if (state is SplashSuccess) {
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Image.asset(AppImages.logo),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
