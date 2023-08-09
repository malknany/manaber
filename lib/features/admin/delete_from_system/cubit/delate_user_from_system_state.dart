// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delate_user_from_system_cubit.dart';

@immutable
abstract class DelateUserFromSystemState {}

class DelateUserFromSystemInitial extends DelateUserFromSystemState {}

class DelateUserFromSystemLoading extends DelateUserFromSystemState {}

class DelateUserFromSystemEmpty extends DelateUserFromSystemState {}

class DelateUserFromSystemErorr extends DelateUserFromSystemState {
  final String msg;
  DelateUserFromSystemErorr({
    required this.msg,
  });
}

class DelateUserFromSystemSuccess extends DelateUserFromSystemState {
  final List<ModelUserAccepteAndDelete> listOfUserspending;
  DelateUserFromSystemSuccess({
    required this.listOfUserspending,
  });
}
