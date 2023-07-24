import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:manaber/features/receptionist/insert_data/model.dart';
import 'package:manaber/shared/network/local/const_key.dart';
import 'package:manaber/shared/network/local/shared_preferences.dart';
import 'package:manaber/shared/network/remote/dio_helper.dart';
import 'package:manaber/shared/network/remote/end_points.dart';
import 'package:meta/meta.dart';

part 'reception_state.dart';

class ReceptionCubit extends Cubit<ReceptionState> {
  ReceptionCubit() : super(ReceptionInitial());
  final token = CacheHelper.getData(key: AppConstKey.token);

  void receptionPostData(ModelReceptiona modelReceptiona) async {
    emit(ReceptionLoading());
    try {
      final response = await DioHelper.postdata(
          url: createReception,
          posteddata: modelReceptiona.toJson(),
          headers: {'Authorization': 'Bearer ${token[0]}'});
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);
        emit(ReceptionSuccess());
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.statusCode);
        print(e.response!.statusMessage);
        emit(ReceptionError(msg: e.response!.data['message']));
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
