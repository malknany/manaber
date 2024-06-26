import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/network/local/const_key.dart';
import '../../../../../shared/network/local/shared_preferences.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';
import '../model.dart';

part 'tretment_plan_state.dart';

class TreatmentPlanCubit extends Cubit<TreatmentPlanState> {
  TreatmentPlanCubit() : super(TretmentPlanInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);
  List<ModelTretmentPlan> listOfModelTretmentPlan = [];
  Future<List<dynamic>> _getPlansFromApi(id, token) async {
    final response = await DioHelper.getData(
        url: treatments + id, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);
      return response.data;
    } else {
      return response.data;
    }
  }

  void getTretmentPlan(id) async {
    emit(TreatmentPlanLoading());
    try {
      _getPlansFromApi(id, token[0]).then((value) {
        listOfModelTretmentPlan =
            value.map((e) => ModelTretmentPlan.fromJson(e)).toList();

        if (listOfModelTretmentPlan.isEmpty) {
          emit(TretmentPlanEmpty());
        } else {
          emit(TretmentPlanSuccess(
              listOfModelTretmentPlan: listOfModelTretmentPlan));
        }
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(TreatmentPlanError(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void delatePlan(
    id,
    idPlan,
  ) async {
    try {
      final response = await DioHelper.deletedata(
          url: '${treatments + id}/$idPlan',
          headers: {'Authorization': 'Bearer ${token[0]}'});

      if (response.statusCode == 204) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void postPlan({titleName, id, listofPlans}) async {
    emit(TreatmentPlanLoading());
    try {
      final response = await DioHelper.putData(
        url: treatments + id,
        postedData: {"name": titleName, "steps": listofPlans},
        headers: {'Authorization': 'Bearer ${token[0]}'},
      );
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(TreatmentPlanSuccessUpLoaded());
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(TreatmentPlanError(msg: e.response!.data['message']));
      } else {
        print(e.message);
        emit(TreatmentPlanError(msg: e.error.toString()));
      }
    } catch (e) {
      print(e.toString());
    }
    // emit(SignUpInitial());
  }
}
