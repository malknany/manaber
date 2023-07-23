// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class ModelReception {}

class TextFormFiledReception extends ModelReception {
  final String lable;
  final TextEditingController controller;
  // List<String>? listOfItem = [];
  TextFormFiledReception({
    // this.listOfItem,
    required this.lable,
    required this.controller,
  });
}

class DropDowneReception extends ModelReception {
  final String lable;
  final TextEditingController controller;
  List<String>? listOfItem = [];
  DropDowneReception({
    required this.lable,
    required this.controller,
    this.listOfItem,
  });
}

class ModelReceptiona {
  ModelReceptiona({
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.department,
    required this.consanguinity,
    required this.cramps,
    required this.currentMedication,
    required this.geneAnalysis,
    required this.geneProblem,
    required this.otherProblems,
    required this.pregnancyProblem,
    required this.sameProblemInFamily,
    required this.vaccinations,
    required this.weigthAtBirth,
  });
  late final String name;
  late final String phoneNumber;
  late final String gender;
  late final String department;
  late final String consanguinity;
  late final String cramps;
  late final String currentMedication;
  late final String geneAnalysis;
  late final String geneProblem;
  late final String otherProblems;
  late final String pregnancyProblem;
  late final bool sameProblemInFamily;
  late final String vaccinations;
  late final String weigthAtBirth;

  ModelReceptiona.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    department = json['department'];
    consanguinity = json['consanguinity'];
    cramps = json['cramps'];
    currentMedication = json['currentMedication'];
    geneAnalysis = json['geneAnalysis'];
    geneProblem = json['geneProblem'];
    otherProblems = json['otherProblems'];
    pregnancyProblem = json['pregnancyProblem'];
    sameProblemInFamily = json['sameProblemInFamily'];
    vaccinations = json['vaccinations'];
    weigthAtBirth = json['weigthAtBirth'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    data['department'] = department;
    data['consanguinity'] = consanguinity;
    data['cramps'] = cramps;
    data['currentMedication'] = currentMedication;
    data['geneAnalysis'] = geneAnalysis;
    data['geneProblem'] = geneProblem;
    data['otherProblems'] = otherProblems;
    data['pregnancyProblem'] = pregnancyProblem;
    data['sameProblemInFamily'] = sameProblemInFamily;
    data['vaccinations'] = vaccinations;
    data['weigthAtBirth'] = weigthAtBirth;
    return data;
  }
}
