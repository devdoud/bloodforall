class UserModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;

  UserModel(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
