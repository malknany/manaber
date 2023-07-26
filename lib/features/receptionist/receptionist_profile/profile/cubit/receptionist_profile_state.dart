// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'receptionist_profile_cubit.dart';

@immutable
abstract class ReceptionistProfileState {}

class ReceptionistProfileInitial extends ReceptionistProfileState {}

class ReceptionistProfileLoading extends ReceptionistProfileState {}

class ReceptionistProfileSuccess extends ReceptionistProfileState {
  final ModelProfile modelReceptionistProfile;
  ReceptionistProfileSuccess({
    required this.modelReceptionistProfile,
  });
}

class ReceptionistProfileError extends ReceptionistProfileState {
  final String msg;
  ReceptionistProfileError({
    required this.msg,
  });
}
