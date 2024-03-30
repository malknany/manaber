import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/local/const_key.dart';
import '../../../../shared/network/local/shared_preferences.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';
import '../model.dart';

part 'pateint_info_state.dart';

class PatientInfoCubit extends Cubit<PatientInfoState> {
  PatientInfoCubit() : super(PateintInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);
  List<ModelPatientInfo> listOfInfoPatient = [];
  getPatinetFromApi(id) async {
    emit(PatientLoading());
    try {
      _getModelApi(id).then((value) {
        listOfInfoPatient =
            value.map((e) => ModelPatientInfo.fromJson(e)).toList();

        emit(PatientSuccess(listOfInfoPatient: listOfInfoPatient));
      });
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(PatientErrorMsg(msg: e.response!.data['message']));
      } else {
        emit(PatientErrorMsg(msg: e.error.toString()));
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> _getModelApi(id) async {
    final response = await DioHelper.getData(
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
    emit(PatientLoading());
    try {
      final response = await Dio().post(
          'http://manaberdev.duckdns.org/$patients$id/answers',
          data: listOfAnswer,
          options: Options(headers: {'Authorization': 'Bearer ${token[0]}'}));
      // final response = await DioHelper.postdata(
      //     url: '$patients$id/answers',
      //     posteddata: listOfAnswer!.map((e) => null),
      //     headers: {'Authorization': 'Bearer ${token[0]}'});
      emit(PatientSuccess(listOfInfoPatient: listOfInfoPatient));
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        return response.data;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(PatientErrorMsg(msg: e.response!.data['message']));
      } else {
        emit(PatientErrorMsg(msg: e.error.toString()));
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
