import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/profile.dart';
import '../../../../../shared/network/local/const_key.dart';
import '../../../../../shared/network/local/shared_preferences.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';

part 'receptionist_profile_state.dart';

class ReceptionistProfileCubit extends Cubit<ReceptionistProfileState> {
  ReceptionistProfileCubit() : super(ReceptionistProfileInitial());

  final token = CacheHelper.getData(key: AppConstKey.token);

  void getInfoPatinet() async {
    emit(ReceptionistProfileLoading());
    try {
      final response = await DioHelper.getdata(
          url: patientinfo, headers: {'Authorization': 'Bearer ${token[0]}'});
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(ReceptionistProfileSuccess(
            modelReceptionistProfile:
                ModelProfile.fromJson(response.data)));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(ReceptionistProfileError(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
