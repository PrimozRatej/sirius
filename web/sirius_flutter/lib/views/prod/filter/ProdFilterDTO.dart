class ProdFilterDTO {
  int id;
  String app;
  String name;
  int created;
  int createdByUser;
  bool isPublic;
  String filterString;

  ProdFilterDTO(
      {this.id,
      this.app,
      this.name,
      this.created,
      this.createdByUser,
      this.isPublic,
      this.filterString});

  factory ProdFilterDTO.fromJson(Map<String, dynamic> json) {
    return ProdFilterDTO(
      id: json['id'],
      app: json['app'],
      name: json['name'],
      created: json['created'],
      createdByUser: json['createdByUser'],
      isPublic: json['isPublic'],
      filterString: json['filterString'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app'] = this.app;
    data['name'] = this.name;
    data['created'] = this.created;
    data['createdByUser'] = this.createdByUser;
    data['isPublic'] = this.isPublic;
    data['filterString'] = this.filterString;
    return data;
  }

  bool isFilterEmpty() {
    if (id == null &&
        app == null &&
        name == null &&
        created == null &&
        createdByUser == null &&
        isPublic == null &&
        filterString == null)
      return true;
    else
      return false;
  }
}
