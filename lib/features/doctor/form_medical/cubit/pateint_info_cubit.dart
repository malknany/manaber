import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manaber/features/doctor/form_medical/model.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import 'package:manaber/shared/network/remote/dio_helper.dart';
import 'package:manaber/shared/network/remote/end_points.dart';

part 'pateint_info_state.dart';

class PateintInfoCubit extends Cubit<PateintInfoState> {
  PateintInfoCubit() : super(PateintInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);
  List<ModelPatientInfo> listOfInfoPatient = [];
  getPatinetFromApi(id) async {
    emit(PateintLoading());
    try {
      _getModelApi(id).then((value) {
        listOfInfoPatient =
            value.map((e) => ModelPatientInfo.fromJson(e)).toList();

        // final listOfInfoPatient = value;
        emit(PateintSuccess(listOfInfoPatient: listOfInfoPatient));
      });
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(PateintErrorMsg(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> _getModelApi(id) async {
    final response = await DioHelper.getdata(
        url: '$patients$id/answers',
        headers: {'Authorization': 'Bearer ${token[0]}'});
    if (response.statusCode == 200) {
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);
      return response.data;
    } else {
      return response.data;
    }
  }

  postAnswerToApi(id, List<Map> listOfAnswer) async {
    emit(PateintLoading());
    try {
      final response = await Dio().post(
          'http://manaberdev.duckdns.org/$patients$id/answers',
          data: listOfAnswer,
          options: Options(headers: {'Authorization': 'Bearer ${token[0]}'}));
      // final response = await DioHelper.postdata(
      //     url: '$patients$id/answers',
      //     posteddata: listOfAnswer!.map((e) => null),
      //     headers: {'Authorization': 'Bearer ${token[0]}'});
      emit(PateintSuccess(listOfInfoPatient: listOfInfoPatient));
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        return response.data;
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(PateintErrorMsg(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<List> _postModelApi({id, List<Map>? listOfAnswer}) async {
  //   final response = await Dio().post(
  //       'http://manaberdev.duckdns.org/$patients$id/answers',
  //       data: listOfAnswer,
  //       options: Options(headers: {'Authorization': 'Bearer ${token[0]}'}));
  //   // final response = await DioHelper.postdata(
  //   //     url: '$patients$id/answers',
  //   //     posteddata: listOfAnswer!.map((e) => null),
  //   //     headers: {'Authorization': 'Bearer ${token[0]}'});
  //   if (response.statusCode == 200) {
  //     print(response.data);
  //     print(response.statusCode);
  //     print(response.statusMessage);
  //     return response.data;
  //   } else {
  //     return response.data;
  //   }
  // }
}
