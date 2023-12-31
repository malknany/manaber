import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/last_ressessment/model.dart';
import '../../../../../shared/network/local/const_key.dart';
import '../../../../../shared/network/local/shared_preferences.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';
part 'Last_reassessment_state.dart';

class LastReassessmentCubit extends Cubit<LastReassessmentState> {
  LastReassessmentCubit() : super(LastReassessmentInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);
  late ModelLastReassessment listOfModelLastReassessment;

  bool isNotEmptyPage = true;

  Future<dynamic> _getLastReassessmentFromApi(id, token) async {
    final response = await DioHelper.getdata(
        url: patients + id + lastReassessment,
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

  void getLastReassessment(id) async {
    emit(LastReassessmentLoading());
    try {
      _getLastReassessmentFromApi(id, token[0]).then((value) {
        // listOfModelLastReassessment =
        // value.map((e) => ModelLastReassessment.fromJson(value)).toList();

        // ignore: unnecessary_null_comparison
        if (value == null) {
          emit(LastReassessmentEmpty());
          
        } else {
          listOfModelLastReassessment = ModelLastReassessment.fromJson(value);
          emit(LastReassessmentSuccess(
              listOfModelLastReassessment: listOfModelLastReassessment));
          
        }
      });
    // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(LastReassessmentError(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // void delatePlan(
  //   id,
  //   idPlan,
  // ) async {
  //   try {
  //     final response = await DioHelper.deletedata(
  //         url: '${treatments + id}/$idPlan',
  //         headers: {'Authorization': 'Bearer ${token[0]}'});

  //     if (response.statusCode == 204) {
  //       print(response.data);
  //       print(response.statusCode);
  //       print(response.statusMessage);
  //     }
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       print(e.response!.data);
  //       print(e.response!.statusCode);
  //       print(e.response!.statusMessage);
  //     } else {
  //       print(e.message);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void postLastReassessment({titleName, id, listofPlans}) async {
    emit(LastReassessmentLoading());
    try {
      final response = await DioHelper.putdata(
        url: patients + id + lastReassessment,
        posteddata: {"name": titleName, "steps": listofPlans},
        headers: {'Authorization': 'Bearer ${token[0]}'},
      );
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(LastReassessmentSuccessUpLoade());
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(LastReassessmentError(msg: e.response!.data['message']));
      } else {
        print(e.message);
        emit(LastReassessmentError(msg: e.error.toString()));
      }
    } catch (e) {
      print(e.toString());
    }
    // emit(SignUpInitial());
  }
}
