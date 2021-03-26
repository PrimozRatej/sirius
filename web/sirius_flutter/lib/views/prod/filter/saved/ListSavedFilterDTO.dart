import 'dart:convert';

class ProdListSavedFilterDTO{
  List<ProdSavedFilterDTO> savedFiltersList;

  ProdListSavedFilterDTO(
      {this.savedFiltersList});

  factory ProdListSavedFilterDTO.fromJson(Map<String, dynamic> json) {
    return ProdListSavedFilterDTO(
      savedFiltersList: json['savedFiltersList'] != null  ? json['savedFiltersList'].map<ProdSavedFilterDTO>((json) => ProdSavedFilterDTO.fromJson(json)).toList()
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

class ProdSavedFilterDTO{
  int filterId;
  String filterName;
  String filterString;
  bool isPublic;

  ProdSavedFilterDTO(
      {this.filterId,
        this.filterName,
        this.filterString,
        this.isPublic});

  factory ProdSavedFilterDTO.fromJson(Map<String, dynamic> json) {
    return ProdSavedFilterDTO(
      filterId: json['filterId'],
      filterName: json['filterName'],
      filterString: json['filterString'],
      isPublic: json['isPublic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filterId'] = this.filterId;
    data['filterName'] = this.filterName;
    data['filterString'] = this.filterString;
    data['isPublic'] = this.isPublic;
    return data;
  }
}