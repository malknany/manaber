import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model.dart';
import '../../../../../shared/network/local/const_key.dart';
import '../../../../../shared/network/local/shared_preferences.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';

part 'xray_state.dart';

class XrayCubit extends Cubit<XrayState> {
  XrayCubit() : super(XrayInitial());
  List<File> images = [];
  final token = CacheHelper.getData(key: AppConstKey.token);
  Reference? ref;

  Future pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      images = result.paths.map((path) => File(path!)).toList();
      emit(XraySelected(images: images));
    } else {
      // User canceled the picker
    }
  }

  Future<List<String>> _uploadImages(id) async {
    final List<Task> uploadTasks = [];
    final counter = DateTime.now();
    for (final imageFile in images) {
      final fileName = '${DateTime.now()}.jpg';
      ref = FirebaseStorage.instance
          .ref()
          .child("media")
          .child('X-ray')
          .child('patient$id')
          .child('images$counter')
          .child(fileName);

      final uploadTask = ref!.putFile(imageFile);
      uploadTasks.add(uploadTask);
    }
    final List<String> downloadUrls = [];
    for (final uploadTask in uploadTasks) {
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      downloadUrls.add(downloadUrl);
    }
    for (var element in downloadUrls) {
      print(element);
    }
    print("length==================${downloadUrls.length}");
    return downloadUrls;
  }

  sendImagesToApi({id}) async {
    emit(XrayLoading());
    await _uploadImages(id).then((url) async {
      try {
        final response = await DioHelper.putData(
            url: media + id,
            postedData: {"name": "first xray", "category": "XRAY", "urls": url},
            headers: {'Authorization': 'Bearer ${token[0]}'});
        if (response.statusCode == 201) {
          print(response.data);
          print(response.statusCode);
          print(response.statusMessage);
          emit(XraySuccess());
        }
      } on DioException catch (e) {
        if (e.response != null) {
          print(e.response!.data);
          print(e.response!.statusCode);
          print(e.response!.statusMessage);
          emit(XrayError(msg: e.response!.data['message']));
        } else {
          emit(XrayError(msg: e.error.toString()));
          print(e.message);
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }

  Future<void> _deleteImage(List<String> urls) async {
    for (final url in urls) {
      ref = FirebaseStorage.instance.refFromURL(url);
      print(ref.toString());
      await ref!.delete();
    }
  }

  deleteImgesFromApi(
    List<String> urls, {
    id,
    idImage,
  }) async {
    await _deleteImage(urls);
    try {
      final response = await DioHelper.deletedata(
          url: "$media$id/$idImage",
          headers: {'Authorization': 'Bearer ${token[0]}'});
      if (response.statusCode == 204) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
      }
    } on DioException catch (e) {
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

  getImagesFromApi(id) async {
    emit(XrayLoading());
    try {
      _getXraysApi(id).then((value) {
        final listOfXray = value.map((e) => ModelXray.fromJson(e)).toList();
        if (listOfXray.isEmpty) {
          emit(XrayEmpty());
        } else {
          emit(GetXraySuccess(listOfModleXray: listOfXray));
        }
      });
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(XrayError(msg: e.response!.data['message']));
      } else {
        emit(XrayError(msg: e.error.toString()));
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<dynamic>> _getXraysApi(id) async {
    final response = await DioHelper.getData(
        url: xray + id, headers: {'Authorization': 'Bearer ${token[0]}'});
    if (response.statusCode == 200) {
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);
      return response.data;
    } else {
      return response.data;
    }
  }
}
