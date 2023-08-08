// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class FileAssessmentModel {}

class TextFormFiledStepperModel extends FileAssessmentModel {
  final String labelName;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;

  TextFormFiledStepperModel({
    required this.labelName,
    this.textInputType,
    required this.textEditingController,
  });
}

class TextFormFiledRightLiftModel extends FileAssessmentModel {
  final String labelName;
  final TextInputType? textInputType;
  final TextEditingController controllerRight;
  final TextEditingController controllerLeft;

  TextFormFiledRightLiftModel({
    required this.labelName,
    this.textInputType = TextInputType.number,
    required this.controllerLeft,
    required this.controllerRight,
  });
}

class DropdownButtonItemModel extends FileAssessmentModel {
  final String labelName;
  final TextEditingController controller;
  final List<String> itemList;

  DropdownButtonItemModel({
    required this.labelName,
    required this.controller,
    required this.itemList,
  });
}

class BottomSheetFileAssModel {
  final String name;
  final List<FileAssessmentModel> itemList;

  BottomSheetFileAssModel({
    required this.itemList,
    required this.name,
  });
}

class DividerFileAssModel {
  final String text;
  DividerFileAssModel({
    required this.text,
  });
}
