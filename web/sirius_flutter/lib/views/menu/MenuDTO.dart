class MenuDTO {
  String username;
  String firstName;
  String lastName;
  String userType;
  bool verified;
  String img;

  MenuDTO({this.firstName, this.lastName, this.userType, this.verified,  this.img, this.username});

  factory MenuDTO.fromJson(Map<String, dynamic> json) {
    return MenuDTO(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userType: json['userType'],
      verified: json['verified'],
      img: json['img'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userType'] = this.userType;
    data['verified'] = this.verified;
    data['img'] = this.img;
    data['username'] = this.username;
    return data;
  }
}
