// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TretmentPlanModel {
  List<TextEditingController> controles;
  TretmentPlanModel({
    required this.controles,
  });
}

class ModelTretmentPlan {
  ModelTretmentPlan({
    required this.id,
    required this.name,
    required this.steps,
    required this.createdAt,
    required this.updatedAt,
    required this.patientId,
  });
  late final String id;
  late final String name;
  late final List<String> steps;
  late final String createdAt;
  late final String updatedAt;
  late final String patientId;
  
  ModelTretmentPlan.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    steps = List.castFrom<dynamic, String>(json['steps']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    patientId = json['patientId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['steps'] = steps;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['patientId'] = patientId;
    return _data;
  }
}