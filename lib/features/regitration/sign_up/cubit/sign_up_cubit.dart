import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUpPostData({name, phone, password, jobType}) async {
    emit(SignUpLoading());
    try {
      final response = await DioHelper.postdata(url: register, posteddata: {
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
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(SignUpErorr(msg: _handelMsgError(e.response!.data['message'])));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
    // emit(SignUpInitial());
  }
}

_handelMsgError(String msg) {
  if (msg == 'Phone number already used.') {
    return 'رقم الهاتف مسجل بالفعل';
  }
  return msg;
}
