import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/admin/accepte_home_page/model.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import 'package:manaber/shared/network/remote/dio_helper.dart';
import 'package:manaber/shared/network/remote/end_points.dart';

part 'pending_state.dart';

class PendingCubit extends Cubit<PendingState> {
  PendingCubit() : super(PendingInitial());

  List<ModelUserAccepte> listOfUsers = [];
  final token = CacheHelper.getData(key: AppConstKey.token);

  getPendingUsers() async {
    emit(PendingLoading());
    try {
      getPendingFromApi(token[0]).then((value) {
        listOfUsers = value.map((e) => ModelUserAccepte.fromJson(e)).toList();
        emit(PendingSuccess(listOfUserspending: listOfUsers));
      });
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(PendingErorr(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  postApprove(
    id,
  ) async {
    final response = await DioHelper.postdata(
        url: approve,
        posteddata: {'userId': id},
        headers: {'Authorization': 'Bearer ${token[0]}'});
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == 204) {
      return true;
    } else {
      print(response.data);
      return response.data['massge'];
    }
  }

  postDisApprove(
    id,
  ) async {
    final response = await DioHelper.postdata(
        url: disapprove,
        posteddata: {'userId': id},
        headers: {'Authorization': 'Bearer ${token[0]}'});
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == 204) {
      return true;
    } else {
      print(response.data);
      return response.data['massge'];
    }
  }
}

Future<List<dynamic>> getPendingFromApi(token) async {
  final response = await DioHelper.getdata(
      url: pendingUsers, headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    print(response.data);
    print(response.statusCode);
    print(response.statusMessage);
    return response.data;
  } else {
    return response.data;
  }
}
