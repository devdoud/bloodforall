class DoctorModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? password;
  String? profil;
  String? hopital;
  String? numOrdreNational;

  DoctorModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.firstname,
      this.lastname,
      this.email,
      this.telephone,
      this.password,
      this.profil,
      this.hopital,
      this.numOrdreNational});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    password = json['password'];
    profil = json['profil'];
    hopital = json['hopital'];
    numOrdreNational = json['numOrdreNational'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['telephone'] = telephone;
    data['password'] = password;
    data['profil'] = profil;
    data['hopital'] = hopital;
    data['numOrdreNational'] = numOrdreNational;
    return data;
  }
}
