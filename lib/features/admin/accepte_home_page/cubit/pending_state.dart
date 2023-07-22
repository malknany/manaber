// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pending_cubit.dart';

@immutable
abstract class PendingState {}

class PendingInitial extends PendingState {}

class PendingLoading extends PendingState {}

class PendingEmpty extends PendingState {}

class PendingErorr extends PendingState {
  final String msg;
  PendingErorr({
    required this.msg,
  });
}

class PendingSuccess extends PendingState {
  final List<ModelUserAccepte> listOfUserspending;
  PendingSuccess({
    required this.listOfUserspending,
  });
}
