// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'Last_reassessment_cubit.dart';

@immutable
abstract class LastReassessmentState {}

class LastReassessmentInitial extends LastReassessmentState {}

class LastReassessmentLoading extends LastReassessmentState {}

class LastReassessmentEmpty extends LastReassessmentState {}

class LastReassessmentSuccessUpLoade extends LastReassessmentState {}


class LastReassessmentError extends LastReassessmentState {
  final String msg;
  LastReassessmentError({
    required this.msg,
  });
}

class LastReassessmentSuccess extends LastReassessmentState {
  final List<ModelLastReassessment> listOfModelLastReassessment;
  LastReassessmentSuccess({
    required this.listOfModelLastReassessment,
  });
}
