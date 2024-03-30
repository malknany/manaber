part of 'patients_department_cubit.dart';

@immutable
abstract class PatientsDepartmentState {}

class PatientsDepartmentInitial extends PatientsDepartmentState {}

class PatientsDepartmentLoading extends PatientsDepartmentState {}

class PatientsDepartmentEmpty extends PatientsDepartmentState {}

class PatientsDepartmentError extends PatientsDepartmentState {
  final String msg;
  PatientsDepartmentError({
    required this.msg,
  });
}

class PatientsDepartmentSuccess extends PatientsDepartmentState {
  final List<Patient> listOfPationt;
  PatientsDepartmentSuccess({
    required this.listOfPationt,
  });
}
