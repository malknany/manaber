import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    try {
      dio = Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,
          baseUrl: baseUrl,
          headers: {"Accept": "application/json"},
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    // Check internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioException(
        error: 'لايوجد اتصال بالانترنت',
        requestOptions: RequestOptions(path: url),
      );
    }

    return await dio.get(url,
        queryParameters: query, options: Options(headers: headers));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? postedData,
    Map<String, dynamic>? query,
    headers,
  }) async {
    // Check internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioException(
        error: 'لايوجد اتصال بالانترنت',
        requestOptions: RequestOptions(path: url),
      );
    }

    return await dio.post(url,
        queryParameters: query,
        data: postedData,
        options: Options(headers: headers));
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required postedData,
    headers,
  }) async {
    // Check internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioException(
        error: 'لايوجد اتصال بالانترنت',
        requestOptions: RequestOptions(path: url),
      );
    }

    return await dio.put(url,
        queryParameters: query,
        data: postedData,
        options: Options(headers: headers));
  }

  static Future<Response> deletedata({required String url, headers}) async {
    // Check internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioException(
        error: 'لايوجد اتصال بالانترنت',
        requestOptions: RequestOptions(path: url),
      );
    }

    return await dio.delete(
      url,
      options: Options(headers: headers),
    );
  }
}