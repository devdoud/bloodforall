class BankModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? nameBankBlood;
  String? adresse;
  String? email;
  String? password;
  String? telephone;
  String? longitude;
  String? lagitude;

  BankModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.nameBankBlood,
      this.adresse,
      this.email,
      this.password,
      this.telephone,
      this.longitude,
      this.lagitude});

  BankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    nameBankBlood = json['nameBankBlood'];
    adresse = json['adresse'];
    email = json['email'];
    password = json['password'];
    telephone = json['telephone'];
    longitude = json['longitude'];
    lagitude = json['lagitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['nameBankBlood'] = nameBankBlood;
    data['adresse'] = adresse;
    data['email'] = email;
    data['password'] = password;
    data['telephone'] = telephone;
    data['longitude'] = longitude;
    data['lagitude'] = lagitude;
    return data;
  }
}
