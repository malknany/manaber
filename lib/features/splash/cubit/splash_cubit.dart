import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../admin/our_section_admin/view.dart';
import '../../doctor/our_sections/view.dart';
import '../../registration/login/cubit/log_in_cubit.dart';
import '../../registration/login/model.dart';
import '../../registration/login/view.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/network/local/const_key.dart';
import '../../../shared/network/local/shared_preferences.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);

  checkToken(
    context,
  ) {
    log("Token====$token");
    if (token != null) {
      _refreshToken();
      // log("Refresh Token====$token");
      if (token[1] == 'DOCTOR') {
        Timer(const Duration(seconds: 4), () {
          navigateAndFinished(context, const OurSections());
        });
      }
      if (token[1] == 'ADMIN') {
        Timer(const Duration(seconds: 4), () {
          navigateAndFinished(context, const AdminHomePage());
        });
      }
    } else {
      Timer(const Duration(seconds: 4), () {
        navigateAndFinished(
            context,
            BlocProvider(
              create: (context) => LogInCubit(),
              child: const LogInScreen(),
            ));
      });
    }
  }

  _refreshToken() async {
    emit(SplashLoading());
    try {
      final response = await DioHelper.postData(
          url: refresh, postedData: {"token": token[0]});
      if (response.statusCode == 200) {
        // print(response.data);
        // print(response.statusCode);
        // print(response.statusMessage);
        final userModel = UsersModel.fromJson(response.data);
        CacheHelper.saveData(
            key: AppConstKey.token, value: [userModel.token, userModel.role]);
        log(
            "Token and Role =====${CacheHelper.getData(key: AppConstKey.token)}");
        emit(SplashSuccess());
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
      } else {
        // print(e.message);
        emit(SplashError(msg: e.error.toString()));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
