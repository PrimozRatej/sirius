import 'dart:convert';

import 'package:sirius_flutter/ixFrame/IxList/IxListItemDTO.dart';

class ProdListDTO{

  List<ProductItemDTO> filteredList;
  int countAlInDB;

  ProdListDTO(
      {this.filteredList,
        this.countAlInDB});

  factory ProdListDTO.fromJson(Map<String, dynamic> json) {
    return ProdListDTO(
      filteredList: json['filteredList'] != null  ? json['filteredList'].map<ProductItemDTO>((json) => ProductItemDTO.fromJson(json)).toList()
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

class ProductItemDTO implements IxListItemDTO {
  int id;
  String imgurImgPath;
  String barCodeNum;
  String name;
  double quantity;
  String quaType;

  ProductItemDTO(
      {this.id,
      this.imgurImgPath,
      this.barCodeNum,
      this.name,
      this.quantity,
      this.quaType});

  factory ProductItemDTO.fromJson(Map<String, dynamic> json) {
    return ProductItemDTO(
      id: json['id'],
      imgurImgPath: json['imgurImgPath'],
      barCodeNum: json['barCodeNum'],
      name: json['name'],
      quantity: json['quantity'],
      quaType: json['quaType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgurImgPath'] = this.imgurImgPath;
    data['barCodeNum'] = this.barCodeNum;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['quaType'] = this.quaType;
    return data;
  }
}
