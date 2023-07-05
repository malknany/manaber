// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ModelReception {
  final String lable;
  final TextEditingController controller;
  List<String>? listOfItem = [];
  ModelReception({
    this.listOfItem,
    required this.lable,
    required this.controller,
  });
}
