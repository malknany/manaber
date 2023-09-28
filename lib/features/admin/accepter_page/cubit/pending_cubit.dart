import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model.dart';
import '../../../../shared/network/local/const_key.dart';
import '../../../../shared/network/local/shared_preferences.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'pending_state.dart';

class PendingCubit extends Cubit<PendingState> {
  PendingCubit() : super(PendingInitial());

  List<ModelUserAccepteAndDelete> listOfUsers = [];
  final token = CacheHelper.getData(key: AppConstKey.token);

  getPendingUsers() async {
    emit(PendingLoading());
    try {
      getPendingFromApi(token[0]).then((value) {
        listOfUsers =
            value.map((e) => ModelUserAccepteAndDelete.fromJson(e)).toList();
        emit(PendingSuccess(listOfUserspending: listOfUsers));
      });
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.statusCode.toString());
        debugPrint(e.response!.statusMessage);
        emit(PendingErorr(msg: e.response!.data['message']));
      } else {
        debugPrint(e.message);
        emit(PendingErorr(msg: e.error.toString()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  postApprove(
    id,
  ) async {
    final response = await DioHelper.postdata(
        url: approve,
        posteddata: {'userId': id},
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

  postDisApprove(
    id,
  ) async {
    final response = await DioHelper.postdata(
        url: disapprove,
        posteddata: {'userId': id},
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

Future<List<dynamic>> getPendingFromApi(token) async {
  final response = await DioHelper.getdata(
      url: pendingUsers, headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    debugPrint(response.data.toString());
    debugPrint(response.statusCode.toString());
    debugPrint(response.statusMessage);
    return response.data;
  } else {
    return response.data;
  }
}
