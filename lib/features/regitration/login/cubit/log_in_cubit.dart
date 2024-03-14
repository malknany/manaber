import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/local/const_key.dart';
import '../../../../shared/network/local/shared_preferences.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';
import '../model.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LoginStates> {
  LogInCubit() : super(LoginInitialStates());

  void logInPostData({phone, password}) async {
    emit(LoginLoadingtState());
    try {
      final response = await DioHelper.postdata(url: logIn, posteddata: {
        "phoneNumber": phone,
        "password": password,
      });
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        UsersModel usersModel = UsersModel.fromJson(response.data);
        // Save token and role in shered preference
        CacheHelper.saveData(
            key: AppConstKey.token, value: [usersModel.token, usersModel.role]);
        print(
            "Token and Role =====${CacheHelper.getData(key: AppConstKey.token)}");
        emit(LoginSuccessState(usersModel: usersModel));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(
            LoginErrorState(msg: _handelMsgError(e.response!.data['message'])));
      } else {
        print(e.error.toString());
        emit(LoginErrorState(msg: e.error.toString()));
      }
    } catch (e) {
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrrr${e.toString()}");
    }
  }
}

_handelMsgError(String msg) {
  if (msg == 'Invalid phone number or password.') {
    return 'رقم الهاتف او كلمة السر غير صحيحة';
  } else if (msg == 'Account not approved.') {
    return 'في انتظار الموافقه على الطلب';
  }
  return msg;
}

// Future<bool> _checkInternetConnectivity() async {
//   final connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult == ConnectivityResult.mobile ||
//       connectivityResult == ConnectivityResult.wifi) {
//     return true;
//   } else {
//     return false;
//   }
// }
