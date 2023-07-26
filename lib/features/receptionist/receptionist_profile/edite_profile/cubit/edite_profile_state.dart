// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edite_profile_cubit.dart';

@immutable
abstract class EditeProfileState {}

class EditeProfileInitial extends EditeProfileState {}

class EditeProfileLoading extends EditeProfileState {}
class EditeProfileSuccess extends EditeProfileState {}

class EditeProfileError extends EditeProfileState {
  final String msg;
  EditeProfileError({
    required this.msg,
  });
}
