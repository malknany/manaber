import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:manaber/features/regitration/login/model.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import 'package:manaber/shared/network/remote/dio_helper.dart';
import 'package:manaber/shared/network/remote/end_points.dart';
import 'package:meta/meta.dart';

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
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(LoginErrorState(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
