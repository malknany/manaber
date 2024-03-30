// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pateint_info_cubit.dart';

@immutable
abstract class PatientInfoState {}

class PateintInitial extends PatientInfoState {}

class PatientLoading extends PatientInfoState {}

class PatientErrorMsg extends PatientInfoState {
  final String msg;
  PatientErrorMsg({
    required this.msg,
  });
}

class PateintEmpty extends PatientInfoState {}

class PatientSuccess extends PatientInfoState {
  final List<ModelPatientInfo> listOfInfoPatient;  
  PatientSuccess({
    required this.listOfInfoPatient,
  });
}
