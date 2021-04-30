import 'package:flutter/cupertino.dart';

class ExportFilterDTO {
  String name;
  String type;
  String objName;
  bool isSelected;
  String image;
  Widget widget;

  ExportFilterDTO(
      {this.name, this.type, this.objName, this.isSelected, this.widget, this.image});

  factory ExportFilterDTO.fromJson(Map<String, dynamic> json) {
    return ExportFilterDTO(
      name: json['name'],
      type: json['type'],
      objName: json['objName'],
      isSelected: json['isSelected'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['objName'] = this.objName;
    data['isSelected'] = this.isSelected;
    data['image'] = this.image;
    return data;
  }

  dynamic getPropVal(String propName){
    switch (propName) {
      case 'name':
        return this.name;
        break;
      case 'type':
        return this.type;
        break;
      case 'objCode':
        return this.objName;
        break;
      case 'isSelected':
        return this.isSelected;
        break;
      case 'name':
        return this.image;
        break;
      default:
        return null;
    }
  }
}