import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUpPostData({name, phone, password, jobType}) async {
    emit(SignUpLoading());
    try {
      final response = await DioHelper.postData(url: register, postedData: {
        "name": name,
        "phoneNumber": phone,
        "password": password,
        "role": jobType
      });
      if (response.statusCode == 204) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(SignUpSuccess());
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(SignUpError(msg: _handelMsgError(e.response!.data['message'])));
      } else {
        emit(SignUpError(msg: e.error.toString()));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

_handelMsgError(String msg) {
  if (msg == 'Phone number already used.') {
    return 'رقم الهاتف مسجل بالفعل';
  }
  return msg;
}
