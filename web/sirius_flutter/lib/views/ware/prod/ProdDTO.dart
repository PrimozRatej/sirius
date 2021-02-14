import 'package:sirius_flutter/ixFrame/IxList/IxListItemDTO.dart';

class ProdDTO implements IxListItemDTO {
  int id;
  String imgurImgPath;
  String barCodeNum;
  String name;
  double quantity;
  String quaType;

  ProdDTO(
      {this.id,
      this.imgurImgPath,
      this.barCodeNum,
      this.name,
      this.quantity,
      this.quaType});

  factory ProdDTO.fromJson(Map<String, dynamic> json) {
    return ProdDTO(
      id: json['id'],
      imgurImgPath: json['imgurImgPath'],
      barCodeNum: json['barCodeNum'],
      name: json['name'],
      quantity: json['quantity'],
      quaType: json['quaType'],
    );
  }
}
