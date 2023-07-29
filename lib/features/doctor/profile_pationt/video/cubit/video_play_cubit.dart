import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/video/model.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import 'package:manaber/shared/network/remote/dio_helper.dart';
import 'package:manaber/shared/network/remote/end_points.dart';

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
      emit(VideoPlaySlected());
    } else {
      // User canceled the picker
    }
  }

  Future<String> uploadVideoToFireBase(id) async {
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
    print("URL==================${downloadUrl}");

    // uploadTask = null;

    return downloadUrl;
  }

  Future<void> deleteFile(String downloadUrl) async {
    ref = FirebaseStorage.instance.refFromURL(downloadUrl);
    print(ref.toString());
    await ref!.delete();
  }

  deleteVideoFromApi({id, idVideo, url}) async {
    await deleteFile(url);
    try {
      final response = await DioHelper.deletedata(
          url: "$media$id/$idVideo",
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

  sendVideoToApi({name, id}) async {
    emit(VideoPlayLoading());
    await uploadVideoToFireBase(id).then((url) async {
      try {
        final response = await DioHelper.putdata(
            url: media + id,
            posteddata: {"name": name, "category": "VIDEO", "url": url},
            headers: {'Authorization': 'Bearer ${token[0]}'});
        if (response.statusCode == 201) {
          print(response.data);
          print(response.statusCode);
          print(response.statusMessage);
          emit(VideoPlaySuccess());
        }
      } on DioError catch (e) {
        if (e.response != null) {
          print(e.response!.data);
          print(e.response!.statusCode);
          print(e.response!.statusMessage);
          emit(VideoPlayError(msg: e.response!.data['message']));
        } else {
          print(e.message);
        }
      } catch (e) {
        print(e.toString());
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
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(VideoPlayError(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<dynamic>> _getModelApi(id) async {
    final response = await DioHelper.getdata(
        url: videos + id, headers: {'Authorization': 'Bearer ${token[0]}'});
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
