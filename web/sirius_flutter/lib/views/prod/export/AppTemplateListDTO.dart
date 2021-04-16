import 'dart:convert';

import 'package:sirius_flutter/ixFrame/IxList/IxListItemDTO.dart';

class AppTemplateListDTO{

  List<AppTemplateDTO> list;
  int countAlInDB;

  AppTemplateListDTO(
      {this.list,
        this.countAlInDB});

  factory AppTemplateListDTO.fromJson(Map<String, dynamic> json) {
    return AppTemplateListDTO(
      list: json['list'] != null  ? json['list'].map<AppTemplateDTO>((json) => AppTemplateDTO.fromJson(json)).toList()
          : null,
      countAlInDB: json['countAlInDB'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filteredList'] = this.list != null ? json.encode(this.list.map((e) => e.toJson()).toList())
        : null;
    data['countAlInDB'] = this.countAlInDB;
    return data;
  }
}

class AppTemplateDTO implements IxListItemDTO {
  int id;
  String name;
  String fileExtension;
  String description;

  AppTemplateDTO(
      {this.id,
        this.name,
        this.fileExtension,
        this.description,});

  factory AppTemplateDTO.fromJson(Map<String, dynamic> json) {
    return AppTemplateDTO(
      id: json['id'],
      name: json['name'],
      fileExtension: json['fileExtension'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fileExtension'] = this.fileExtension;
    data['description'] = this.description;
    return data;
  }

  dynamic getPropVal(String propName){
    switch (propName) {
      case 'id':
        return this.id;
        break;
      case 'name':
        return this.name;
        break;
      case 'fileExtension':
        return this.fileExtension;
        break;
      case 'description':
        return this.description;
        break;
      default:
        return null;
    }
  }
}
