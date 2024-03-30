import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/profile.dart';
import '../../../../../shared/network/local/const_key.dart';
import '../../../../../shared/network/local/shared_preferences.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';

part 'profile_doctor_state.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileState> {
  DoctorProfileCubit() : super(DoctorProfileInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);

  void getProfileDoctor() async {
    emit(DoctorProfileLoading());
    try {
      final response = await DioHelper.getData(
          url: patientInfo, headers: {'Authorization': 'Bearer ${token[0]}'});
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(DoctorProfileSuccess(
            modelDoctorProfile: ModelProfile.fromJson(response.data)));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(DoctorProfileError(msg: e.response!.data['message']));
      } else {
        emit(DoctorProfileError(msg: e.error.toString()));
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
