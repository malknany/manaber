part of 'edite_profile_doctor_cubit.dart';

@immutable
abstract class EditProfileDoctorState {}

class EditProfileDoctorInitial extends EditProfileDoctorState {}

class EditProfileDoctorLoading extends EditProfileDoctorState {}

class EditProfileDoctorSuccess extends EditProfileDoctorState {}

class EditProfileDoctorError extends EditProfileDoctorState {
  final String msg;
  EditProfileDoctorError({
    required this.msg,
  });
}
