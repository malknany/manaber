part of 'profile_doctor_cubit.dart';

@immutable
abstract class DoctorProfileState {}

class DoctorProfileInitial extends DoctorProfileState {}



class DoctorProfileLoading extends DoctorProfileState {}

class DoctorProfileSuccess extends DoctorProfileState {
  final ModelProfile modelDoctorProfile;
  DoctorProfileSuccess({
    required this.modelDoctorProfile,
  });
}

class DoctorProfileError extends DoctorProfileState {
  final String msg;
  DoctorProfileError({
    required this.msg,
  });
}
