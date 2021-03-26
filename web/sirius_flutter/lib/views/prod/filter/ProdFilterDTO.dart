class ProdFilterDTO {
  int id;
  String app;
  int appObjectId;
  String name;
  int created;
  int createdByUser;
  bool isPublic;
  String filterString;
  String username;
  String objName;

  ProdFilterDTO(
      {this.id,
      this.app,
      this.appObjectId,
      this.objName,
      this.name,
      this.created,
      this.createdByUser,
      this.isPublic,
      this.filterString,
      this.username});

  factory ProdFilterDTO.fromJson(Map<String, dynamic> json) {
    return ProdFilterDTO(
      id: json['id'],
      app: json['app'],
      appObjectId: json['appObjectId'],
      name: json['name'],
      objName: json['objName'],
      created: json['created'],
      createdByUser: json['createdByUser'],
      isPublic: json['isPublic'],
      filterString: json['filterString'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app'] = this.app;
    data['appObjectId'] = this.appObjectId;
    data['name'] = this.name;
    data['objName'] = this.objName;
    data['created'] = this.created;
    data['createdByUser'] = this.createdByUser;
    data['isPublic'] = this.isPublic;
    data['filterString'] = this.filterString;
    data['username'] = this.username;
    return data;
  }
}
