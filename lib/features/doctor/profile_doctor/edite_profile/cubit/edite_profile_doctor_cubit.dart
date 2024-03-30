import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/network/local/const_key.dart';
import '../../../../../shared/network/local/shared_preferences.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';

part 'edite_profile_doctor_state.dart';

class EditProfileDoctorCubit extends Cubit<EditProfileDoctorState> {
  EditProfileDoctorCubit() : super(EditProfileDoctorInitial());

  final token = CacheHelper.getData(key: AppConstKey.token);

  postEditProfile({name, password}) async {
    emit(EditProfileDoctorLoading());
    try {
      final response = await DioHelper.postData(url: editProfile, postedData: {
        "name": name, //Required even if user doesn't change
        "newPassword": password //Optional
      }, headers: {
        'Authorization': 'Bearer ${token[0]}'
      });
      if (response.statusCode == 204) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(EditProfileDoctorSuccess());
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(EditProfileDoctorError(msg: e.response!.data['message']));
      } else {
        print(e.message);
         emit(EditProfileDoctorError(msg: e.error.toString()));
      }
    } catch (e) {
      print(e.toString());
    }
    // emit(SignUpInitial());
  }
}
