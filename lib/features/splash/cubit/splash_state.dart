// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashSuccess extends SplashState {}

class SplashError extends SplashState {
  final String msg;
  SplashError({
    required this.msg,
  });
}
