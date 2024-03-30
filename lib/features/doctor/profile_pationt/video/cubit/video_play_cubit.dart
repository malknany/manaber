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

part 'video_play_state.dart';

class VideoPlayCubit extends Cubit<VideoPlayState> {
  VideoPlayCubit() : super(VideoPlayInitial());
  File? video;
  final TextEditingController controllertitle = TextEditingController();

  UploadTask? uploadTask;
  final token = CacheHelper.getData(key: AppConstKey.token);
  TaskSnapshot? snapshot;
  Reference? ref;
  Future<void> slectFromGallary() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.video,
    );

    if (result != null) {
      final file = result.files.first;
      video = File(file.path!);
      emit(VideoPlaySelected());
    } else {
      // User canceled the picker
    }
  }

  Future<List<String>> uploadVideoToFireBase(id) async {
    final counter = DateTime.now();
    final fileName = '${DateTime.now()}.jpg';
    ref = FirebaseStorage.instance
        .ref()
        .child("media")
        .child('video')
        .child('patient$id')
        .child('vids$counter')
        .child(controllertitle.text)
        .child(fileName);

    uploadTask = ref!.putFile(video!);

    snapshot = await uploadTask!.whenComplete(() {});
    final downloadUrl = await snapshot!.ref.getDownloadURL();
    List<String> listOfUrl = [];
    listOfUrl.add(downloadUrl);
    debugPrint("URL==================$listOfUrl");

    // uploadTask = null;

    return listOfUrl;
  }

  Future<void> deleteFile(String downloadUrl) async {
    ref = FirebaseStorage.instance.refFromURL(downloadUrl);
    debugPrint(ref.toString());
    await ref!.delete();
  }

  deleteVideoFromApi({id, idVideo, url}) async {
    await deleteFile(url);
    try {
      final response = await DioHelper.deletedata(
          url: "$media$id/$idVideo",
          headers: {'Authorization': 'Bearer ${token[0]}'});
      if (response.statusCode == 204) {
        debugPrint(response.data);
        debugPrint(response.statusCode.toString());
        debugPrint(response.statusMessage);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.statusCode.toString());
        debugPrint(e.response!.statusMessage);
      } else {
        debugPrint(e.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  sendVideoToApi({name, id}) async {
    emit(VideoPlayLoading());
    await uploadVideoToFireBase(id).then((url) async {
      try {
        final response = await DioHelper.putData(
            url: media + id,
            postedData: {"name": name, "category": "VIDEO", "urls": url},
            headers: {'Authorization': 'Bearer ${token[0]}'});
        if (response.statusCode == 201) {
          debugPrint(response.data);
          debugPrint(response.statusCode.toString());
          debugPrint(response.statusMessage);
          emit(VideoPlaySuccess());
        }
      } on DioException catch (e) {
        if (e.response != null) {
          debugPrint(e.response!.data);
          debugPrint(e.response!.statusCode.toString());
          debugPrint(e.response!.statusMessage);
          emit(VideoPlayError(msg: e.response!.data['message']));
        } else {
          emit(VideoPlayError(msg: e.error.toString()));
          debugPrint(e.message);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  getVideosFromApi(id) async {
    emit(VideoPlayLoading());
    try {
      _getModelApi(id).then((value) {
        final listOfUsersVideo =
            value.map((e) => ModelVideo.fromJson(e)).toList();
        if (listOfUsersVideo.isEmpty) {
          emit(VideoPlayEmpty());
        } else {
          emit(VideoPlaySuccessUser(listOfModle: listOfUsersVideo));
        }
      });
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.statusCode.toString());
        debugPrint(e.response!.statusMessage);
        emit(VideoPlayError(msg: e.response!.data['message']));
      } else {
        emit(VideoPlayError(msg: e.error.toString()));
        debugPrint(e.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<dynamic>> _getModelApi(id) async {
    final response = await DioHelper.getData(
        url: videos + id, headers: {'Authorization': 'Bearer ${token[0]}'});
    if (response.statusCode == 200) {
      print(response.data.toString());
      debugPrint(response.statusCode.toString());
      debugPrint(response.statusMessage);
      return response.data;
    } else {
      return response.data;
    }
  }
}
