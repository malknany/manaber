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
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(PatientsDepartmentSuccess(listOfPationt: filteredPatients));
    }
    // emit(PatientsDepartmentInitial());
  }

  getPationtDepartment(department) async {
    emit(PatientsDepartmentLoading());
    try {
      _getPationDepartmentFromApi(token[0], department).then((value) {
        listOfUsers = value.map((e) => Patient.fromJson(e)).toList();
        emit(PatientsDepartmentSuccess(listOfPationt: listOfUsers));
      });
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(PatientsDepartmentErorr(msg: e.response!.data['message']));
      } else {
        emit(PatientsDepartmentErorr(msg: e.error.toString()));
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

Future<List<dynamic>> _getPationDepartmentFromApi(token, department) async {
  final response = await DioHelper.getdata(
      url: patientsDepartment + department,
      headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    print(response.data);
    print(response.statusCode);
    print(response.statusMessage);
    return response.data;
  } else {
    return response.data;
  }
}
