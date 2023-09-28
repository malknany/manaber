part of 'edite_profile_doctor_cubit.dart';

@immutable
abstract class EditeProfileDoctorState {}

class EditeProfileDoctorInitial extends EditeProfileDoctorState {}

class EditeProfileDoctorLoading extends EditeProfileDoctorState {}

class EditeProfileDoctorSuccess extends EditeProfileDoctorState {}

class EditeProfileDoctorError extends EditeProfileDoctorState {
  final String msg;
  EditeProfileDoctorError({
    required this.msg,
  });
}
