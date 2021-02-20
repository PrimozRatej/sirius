import 'package:sirius_flutter/ixFrame/IxList/IxListFilterDTO.dart';

class ProdFIlterCriteriaDTO implements IxListFilterDTO {
  @override
  String search;

  int userId;
  bool isPublic;

  ProdFIlterCriteriaDTO({
    this.userId,
    this.isPublic,
  });

  factory ProdFIlterCriteriaDTO.fromJson(Map<String, dynamic> json) {
    return ProdFIlterCriteriaDTO(
      userId: json['userId'],
      isPublic: json['isPublic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['isPublic'] = this.isPublic;
    return data;
  }

  bool isFilterEmpty() {
    if (userId == null && isPublic == null)
      return true;
    else
      return false;
  }
}
