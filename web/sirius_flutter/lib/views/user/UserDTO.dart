class UserDTO {
  int id;

  String username;

  String firstName;

  String lastName;

  String email;

  String gender;

  int registered;

  int lastLogin;

  bool isOnline;

  String picture;

  UserDTO(
      {this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.registered,
        this.lastLogin,
        this.isOnline,
        this.picture,});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
      registered: json['registered'],
      lastLogin: json['lastLogin'],
      isOnline: json['isOnline'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['registered'] = this.registered;
    data['lastLogin'] = this.lastLogin;
    data['isOnline'] = this.isOnline;
    data['picture'] = this.picture;
    return data;
  }

}
