import 'package:flutter/material.dart';

class TextFormFiledStepperModel {
  final String labelName;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;

  TextFormFiledStepperModel({
    required this.labelName,
    this.textInputType,
    required this.textEditingController,
  });
}

class DropdownButtonItemModel {
  final String labelName;
  final TextEditingController controller;
  final List<String> itemList;

  DropdownButtonItemModel({
    required this.labelName,
    required this.controller,
    required this.itemList,
  });
}