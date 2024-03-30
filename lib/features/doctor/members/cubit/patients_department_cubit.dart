import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model.dart';
import '../../../../shared/network/local/const_key.dart';
import '../../../../shared/network/local/shared_preferences.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'patients_department_state.dart';

class PatientsDepartmentCubit extends Cubit<PatientsDepartmentState> {
  PatientsDepartmentCubit() : super(PatientsDepartmentInitial());

  List<Patient> listOfUsers = [];

  final token = CacheHelper.getData(key: AppConstKey.token);

  filterListOfPatient(String value) {
    final List<Patient> filteredPatients;
    emit(PatientsDepartmentLoading());
    if (value.isEmpty) {
      // _filteredPatients = List<Patient>.from(listOfUsers);
      filteredPatients = listOfUsers;
      emit(PatientsDepartmentSuccess(listOfPationt: filteredPatients));
    } else {
      filteredPatients = listOfUsers
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(PatientsDepartmentSuccess(listOfPationt: filteredPatients));
    }
    // emit(PatientsDepartmentInitial());
  }

  getPatientDepartment(department) async {
    emit(PatientsDepartmentLoading());
    try {
      _getPatientDepartmentFromApi(token[0], department).then((value) {
        listOfUsers = value.map((e) => Patient.fromJson(e)).toList();
        emit(PatientsDepartmentSuccess(listOfPationt: listOfUsers));
      });
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.data);
        log("${e.response!.statusCode}");
        log("${e.response!.statusMessage}");
        emit(PatientsDepartmentError(msg: e.response!.data['message']));
      } else {
        emit(PatientsDepartmentError(msg: e.error.toString()));
        log("${e.message}");
      }
    } on SocketException catch (e) {
      log(e.toString());
    }
  }
}

Future<List<dynamic>> _getPatientDepartmentFromApi(token, department) async {
  final response = await DioHelper.getData(
      url: patientsDepartment + department,
      headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    log("${response.data}");
    log("${response.statusCode}");
    log("${response.statusMessage}");
    return response.data;
  } else {
    return response.data;
  }
}
