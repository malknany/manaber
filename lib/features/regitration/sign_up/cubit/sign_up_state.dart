// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpErorr extends SignUpState {
  final String msg;
  SignUpErorr({
    required this.msg,
  });
}

class SignUpSuccess extends SignUpState {}
