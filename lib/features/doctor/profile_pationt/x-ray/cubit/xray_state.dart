// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'xray_cubit.dart';

@immutable
abstract class XrayState {}

class XrayInitial extends XrayState {}

class XrayLoading extends XrayState {}

class XrayError extends XrayState {
  final String msg;
  XrayError({
    required this.msg,
  });
}

class XraySuccess extends XrayState {}

class GetXraySuccess extends XrayState {
  final List<ModelXray> listOfModleXray;
  GetXraySuccess({
    required this.listOfModleXray,
  });
}

class XrayEmpty extends XrayState {}

class XraySelected extends XrayState {
  final List<File> images;
  XraySelected({
    required this.images,
  });
}
