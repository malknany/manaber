// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edite_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditeProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}
class EditProfileSuccess extends EditProfileState {}

class EditProfileError extends EditProfileState {
  final String msg;
  EditProfileError({
    required this.msg,
  });
}
