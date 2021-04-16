import 'package:flutter/cupertino.dart';

class ExportTypeDTO {
  String name;
  String prop;
  bool isSelected;
  String image;
  Widget widget;

  ExportTypeDTO(
      {this.name, this.prop, this.isSelected, this.widget, this.image});
}