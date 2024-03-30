import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../accepter_page/model.dart';
import '../../../../shared/network/local/const_key.dart';
import '../../../../shared/network/local/shared_preferences.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'delate_user_from_system_state.dart';

class DelateUserFromSystemCubit extends Cubit<DelateUserFromSystemState> {
  DelateUserFromSystemCubit() : super(DelateUserFromSystemInitial());

  List<ModelUserAccepteAndDelete> listOfUsers = [];
  final token = CacheHelper.getData(key: AppConstKey.token);

  getPendingUsers() async {
    emit(DelateUserFromSystemLoading());
    try {
      _getAllUserFromApi(token[0]).then((value) {
        listOfUsers =
            value.map((e) => ModelUserAccepteAndDelete.fromJson(e)).toList();
        emit(DelateUserFromSystemSuccess(listOfUserspending: listOfUsers));
      });
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.statusCode.toString());
        debugPrint(e.response!.statusMessage);
        emit(DelateUserFromSystemErorr(msg: e.response!.data['message']));
      } else {
        debugPrint(e.message);
        emit(DelateUserFromSystemErorr(msg: e.error.toString()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteUser(
    id,
  ) async {
    final response = await DioHelper.deletedata(
        url: deleteUsers + id,
        headers: {'Authorization': 'Bearer ${token[0]}'});
    debugPrint(response.data);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 204) {
      return true;
    } else {
      debugPrint(response.data);
      return response.data['massge'];
    }
  }
}

Future<List<dynamic>> _getAllUserFromApi(token) async {
  final response = await DioHelper.getData(
      url: allUsers, headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    debugPrint(response.data.toString());
    debugPrint(response.statusCode.toString());
    debugPrint(response.statusMessage);
    return response.data;
  } else {
    return response.data;
  }
}
