// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'log_in_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final UsersModel usersModel;
  LoginSuccessState({
    required this.usersModel,
  });
}

class LoginErrorState extends LoginStates {
  final String msg;

  LoginErrorState({required this.msg});
}
