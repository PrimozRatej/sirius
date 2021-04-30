import 'dart:convert';

import 'package:sirius_flutter/ixFrame/IxList/IxListItemDTO.dart';

import 'DownloadFileService.dart';

class ExportListDTO{

  List<ExportItemDTO> filteredList;
  int countAlInDB;

  ExportListDTO(
      {this.filteredList,
        this.countAlInDB});

  factory ExportListDTO.fromJson(Map<String, dynamic> json) {
    return ExportListDTO(
      filteredList: json['filteredList'] != null  ? json['filteredList'].map<ExportItemDTO>((json) => ExportItemDTO.fromJson(json)).toList()
          : null,
      countAlInDB: json['countAlInDB'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filteredList'] = this.filteredList != null ? json.encode(this.filteredList.map((e) => e.toJson()).toList())
        : null;
    data['countAlInDB'] = this.countAlInDB;
    return data;
  }
}

class ExportItemDTO implements IxListItemDTO {
  int id;
  int appId;
  int objId;
  String name;
  String fileExtension;
  String fileData;
  String description;
  AppTemplateViewProps viewProps;

  ExportItemDTO(
      { this.id,
        this.appId,
        this.objId,
        this.name,
        this.fileExtension,
        this.fileData,
        this.description}){
    viewProps = new AppTemplateViewProps();
  }

  factory ExportItemDTO.fromJson(Map<String, dynamic> json) {
    return ExportItemDTO(
      id: json['id'],
      appId: json['appId'],
      objId: json['objId'],
      name: json['name'],
      fileExtension: json['fileExtension'],
      fileData: json['fileData'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appId'] = this.appId;
    data['objId'] = this.objId;
    data['name'] = this.name;
    data['fileExtension'] = this.fileExtension;
    data['fileData'] = this.fileData;
    data['description'] = this.description;
    return data;
  }

  dynamic getPropVal(String propName){
    switch (propName) {
      case 'id':
        return this.id;
        break;
      case 'appId':
        return this.appId;
        break;
      case 'objId':
        return this.objId;
        break;
      case 'name':
        return this.name;
        break;
      case 'fileExtension':
        return this.fileExtension;
        break;
      case 'fileData':
        return this.fileData;
        break;
      case 'description':
        return this.description;
        break;
      default:
        return null;
    }
  }
  
}

class AppTemplateViewProps{
  int percentDownloaded;
  DownloadFileService downloadFileService;
  AppTemplateViewProps(){
    percentDownloaded = 0;
  }

void downloading(received, total, state, list, index) {
    double dou;
    if (total != -1) {
      state.setState(() {
        dou = (received / total * 100);
        list.filteredList[index].viewProps.percentDownloaded =
            dou.round();
      });
    }
  }

bool isDownloading(int percent) {
    if (percent == 0 || percent == 100)
      return false;
    else
      return true;
  }

}
