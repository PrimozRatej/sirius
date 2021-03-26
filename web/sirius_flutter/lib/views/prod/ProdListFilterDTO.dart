import 'package:sirius_flutter/ixFrame/IxList/IxListFilterDTO.dart';
import 'package:sirius_flutter/views/lookup/QuantityType/QuantityTypeLookupModelDTO.dart';

class ProdListFilterDTO implements IxListFilterDTO {
  String search;
  // SKU
  int skuExact;
  int skuFrom;
  int skuTo;
  // Quantity
  int quantityExact;
  int quantityFrom;
  int quantityTo;
  //QuantityType
  QuantityTypeLookupModelDTO quantityType;

  ProdListFilterDTO(
      {this.search,
      this.skuFrom,
      this.skuTo,
      this.skuExact,
      this.quantityExact,
      this.quantityFrom,
      this.quantityTo,
      this.quantityType});

  factory ProdListFilterDTO.fromJson(Map<String, dynamic> json) {
    return ProdListFilterDTO(
      search: json['search'],
      skuExact: json['skuExact'],
      skuFrom: json['skuFrom'],
      skuTo: json['skuTo'],
      quantityExact: json['quantityExact'],
      quantityFrom: json['quantityFrom'],
      quantityTo: json['quantityTo'],
      quantityType: json['quantityType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['search'] = this.search;
    data['skuExact'] = this.skuExact;
    data['skuFrom'] = this.skuFrom;
    data['skuTo'] = this.skuTo;
    data['quantityExact'] = this.quantityExact;
    data['quantityFrom'] = this.quantityFrom;
    data['quantityTo'] = this.quantityTo;
    data['quantityType'] = this.quantityType;
    return data;
  }

  bool isFilterEmpty() {
    if (search == null &&
        skuFrom == null &&
        skuTo == null &&
        skuExact == null &&
        quantityExact == null &&
        quantityFrom == null &&
        quantityTo == null &&
        quantityType == null)
      return true;
    else
      return false;
  }
}
