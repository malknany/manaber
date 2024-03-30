// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class ModelOccupation {}

class ModelTextFiledOccupation extends ModelOccupation {
  final String labelname;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  ModelTextFiledOccupation({
    required this.labelname,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
  });
}

class ModelDropDownOccupation extends ModelOccupation {
  final String labelName;
  final List<String> itemList;
  final TextEditingController textEditingController;
  ModelDropDownOccupation({
    required this.labelName,
    required this.itemList,
    required this.textEditingController,
  });
}

class ModelDividerOccupation extends ModelOccupation {
  final String text;
  ModelDividerOccupation({
    required this.text,
  });
}
