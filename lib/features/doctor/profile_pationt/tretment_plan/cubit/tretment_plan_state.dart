// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tretment_plan_cubit.dart';

@immutable
abstract class TretmentPlanState {}

class TretmentPlanInitial extends TretmentPlanState {}

class TretmentPlanLoading extends TretmentPlanState {}

class TretmentPlanEmpty extends TretmentPlanState {}

class TretmentPlanSuccessUpLoade extends TretmentPlanState {}
// class TretmentPlanSuccessDelate extends TretmentPlanState {}
// class TretmentPlanLoadingDelate extends TretmentPlanState {}
// class TretmentPlanIdelDelate extends TretmentPlanState {}
// class TretmentPlanShowDelateIcon extends TretmentPlanState {}

class TretmentPlanError extends TretmentPlanState {
  final String msg;
  TretmentPlanError({
    required this.msg,
  });
}

class TretmentPlanSuccess extends TretmentPlanState {
  final List<ModelTretmentPlan> listOfModelTretmentPlan;
  TretmentPlanSuccess({
    required this.listOfModelTretmentPlan,
  });
}
