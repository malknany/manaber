import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import 'package:manaber/shared/network/remote/dio_helper.dart';
import 'package:manaber/shared/network/remote/end_points.dart';

part 'edite_profile_state.dart';

class EditeProfileCubit extends Cubit<EditeProfileState> {
  EditeProfileCubit() : super(EditeProfileInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);

  postEditeProfile({name, password}) async {
    emit(EditeProfileLoading());
    try {
      final response = await DioHelper.postdata(url: editProfile, posteddata: {
        "name": name, //Required even if user doesn't change
        "newPassword": password //Optional
      }, headers: {
        'Authorization': 'Bearer ${token[0]}'
      });
      if (response.statusCode == 204) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(EditeProfileSuccess());
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(EditeProfileError(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
    // emit(SignUpInitial());
  }
}
