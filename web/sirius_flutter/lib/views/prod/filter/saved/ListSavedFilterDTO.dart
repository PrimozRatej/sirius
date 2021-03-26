import 'dart:convert';

import '../ProdFilterDTO.dart';

class ProdListSavedFilterDTO{
  List<ProdFilterDTO> savedFiltersList;

  ProdListSavedFilterDTO(
      {this.savedFiltersList});

  factory ProdListSavedFilterDTO.fromJson(List<dynamic> json) {
    return ProdListSavedFilterDTO(
      savedFiltersList: json != null  ? json.map<ProdFilterDTO>((json) => ProdFilterDTO.fromJson(json)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['savedFiltersList'] = this.savedFiltersList != null ? json.encode(this.savedFiltersList.map((e) => e.toJson()).toList())
        : null;
    return data;
  }
}