import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/registration/login/cubit/log_in_cubit.dart';
import '../../features/registration/login/view.dart';
import '../network/local/const_key.dart';

import '../network/local/shared_preferences.dart';

navigateTo(context, screen) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

navigateAndReplace(context, screen) => Navigator.of(context)
    .pushReplacement(MaterialPageRoute(builder: (_) => screen));

navigateAndFinished(context, screen) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen), (route) => false);

void signOut(context) {
  CacheHelper.removeToken(key: AppConstKey.token).then((value) {
    navigateAndFinished(
        context,
        BlocProvider(
          create: (context) => LogInCubit(),
          child: const LogInScreen(),
        ));
  });
}
