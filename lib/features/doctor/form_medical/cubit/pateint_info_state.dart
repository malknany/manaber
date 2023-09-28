// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pateint_info_cubit.dart';

@immutable
abstract class PateintInfoState {}

class PateintInitial extends PateintInfoState {}

class PateintLoading extends PateintInfoState {}

class PateintErrorMsg extends PateintInfoState {
  final String msg;
  PateintErrorMsg({
    required this.msg,
  });
}

class PateintEmpty extends PateintInfoState {}

class PateintSuccess extends PateintInfoState {
  final List<ModelPatientInfo> listOfInfoPatient;  
  PateintSuccess({
    required this.listOfInfoPatient,
  });
}
