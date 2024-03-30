// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tretment_plan_cubit.dart';

@immutable
abstract class TreatmentPlanState {}

class TretmentPlanInitial extends TreatmentPlanState {}

class TreatmentPlanLoading extends TreatmentPlanState {}

class TretmentPlanEmpty extends TreatmentPlanState {}

class TreatmentPlanSuccessUpLoaded extends TreatmentPlanState {}
// class TretmentPlanSuccessDelate extends TretmentPlanState {}
// class TretmentPlanLoadingDelate extends TretmentPlanState {}
// class TretmentPlanIdelDelate extends TretmentPlanState {}
// class TretmentPlanShowDelateIcon extends TretmentPlanState {}

class TreatmentPlanError extends TreatmentPlanState {
  final String msg;
  TreatmentPlanError({
    required this.msg,
  });
}

class TretmentPlanSuccess extends TreatmentPlanState {
  final List<ModelTretmentPlan> listOfModelTretmentPlan;
  TretmentPlanSuccess({
    required this.listOfModelTretmentPlan,
  });
}
