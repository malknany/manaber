// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reception_cubit.dart';

@immutable
abstract class ReceptionState {}

class ReceptionInitial extends ReceptionState {}

class ReceptionLoading extends ReceptionState {}

class ReceptionError extends ReceptionState {
  final String msg;
  ReceptionError({
    required this.msg,
  });
}

class ReceptionSuccess extends ReceptionState {}
